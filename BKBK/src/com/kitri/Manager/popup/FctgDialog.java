package com.kitri.Manager.popup;

import java.awt.*;

import javax.swing.*;
import javax.swing.border.EmptyBorder;

import com.kitri.Manager.dao.FoodDao;

import java.awt.event.ActionListener;
import java.util.List;
import java.awt.event.ActionEvent;

public class FctgDialog extends JDialog {
	private final JPanel contentPanel = new JPanel();

	public JTextField menuTF = new JTextField();
	public JTextField priceTF = new JTextField();
	String[] ctg = {"음료", "과자", "라면", "음식"};
	public JComboBox ctgC = new JComboBox(ctg);
	
	public JPanel cardP = new JPanel();
	public CardLayout card = new CardLayout();
	public JPanel mdfP = new JPanel();
	public JPanel addP = new JPanel();
	
	private final JLabel label = new JLabel("재료1");
	public JComboBox st1C = new JComboBox();
	public JTextField st1A = new JTextField();
	private final JLabel label_2 = new JLabel("재료2");
	public JComboBox st2C = new JComboBox();
	private final JLabel label_3 = new JLabel("수량 :");
	public JTextField st2A = new JTextField();
	private final JLabel label_4 = new JLabel("재료3");
	
	public JComboBox st3C = new JComboBox();
	private final JLabel label_5 = new JLabel("수량 :");
	public JTextField st3A = new JTextField();

	JPanel buttonPane = new JPanel();
	public JButton delB = new JButton("삭제");
	public JButton mdfB = new JButton("수정");
	public JButton addB = new JButton("추가");
	public JButton cancelB = new JButton("취소");

	/**
	 * Create the dialog.
	 */
	public FctgDialog() {
		contentPanel.setBounds(0, 0, 305, 366);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		JLabel tl1 = new JLabel("카테고리");
		tl1.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		tl1.setBounds(16, 20, 137, 33);
		ctgC.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		ctgC.setBackground(SystemColor.window);
		ctgC.setBounds(97, 23, 126, 30);

		JLabel tl2 = new JLabel("메뉴 이름");
		tl2.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		tl2.setBounds(16, 75, 97, 21);
		menuTF.setHorizontalAlignment(SwingConstants.CENTER);
		menuTF.setBounds(97, 73, 192, 30);
		menuTF.setColumns(10);

		JLabel tl3 = new JLabel("가격");
		tl3.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		tl3.setBounds(16, 137, 57, 15);
		priceTF.setHorizontalAlignment(SwingConstants.CENTER);
		priceTF.setBounds(63, 131, 120, 30);
		priceTF.setColumns(10);

		JLabel tl4 = new JLabel("원");
		tl4.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		tl4.setBounds(195, 134, 57, 21);

		contentPanel.setBackground(SystemColor.control);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPanel.setLayout(null);
		contentPanel.add(tl1);
		contentPanel.add(ctgC);
		contentPanel.add(tl2);
		contentPanel.add(menuTF);
		contentPanel.add(tl3);
		contentPanel.add(priceTF);
		contentPanel.add(tl4);
		
		
		addP.setBounds(0, 0, 165, 30);
		addP.setLayout(null);
		addB.setFont(new Font("맑은 고딕", Font.PLAIN, 11));
		addB.setBounds(117, 2, 70, 25);
		addP.add(addB);
		
		mdfP.setBounds(0, 0, 165, 30);
		mdfP.setLayout(null);
		mdfB.setFont(new Font("맑은 고딕", Font.PLAIN, 11));
		mdfB.setBounds(35, 2, 70, 25);
		delB.setFont(new Font("맑은 고딕", Font.PLAIN, 11));
		delB.setBounds(117, 2, 70, 25);
		mdfP.add(mdfB);
		mdfP.add(delB);

		cardP.setBounds(0, 0, 199, 30);
		cardP.setLayout(card);
		cardP.add(mdfP, "mdf");
		cardP.add(addP, "add");


		buttonPane.setBounds(0, 367, 305, 33);
		buttonPane.setLayout(null);
		cancelB.setFont(new Font("맑은 고딕", Font.PLAIN, 11));
		cancelB.setBounds(200, 2, 70, 25);
		buttonPane.add(cancelB);
		buttonPane.add(cardP);

		getContentPane().setLayout(null);
		getContentPane().add(contentPanel);
		
		st1C.setBounds(63, 189, 120, 30);
		contentPanel.add(st1C);
		label.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label.setBounds(16, 195, 57, 15);
		
		contentPanel.add(label);
		
		
		st1A.setHorizontalAlignment(SwingConstants.CENTER);
		st1A.setColumns(10);
		st1A.setBounds(245, 190, 44, 30);
		contentPanel.add(st1A);
		
		JLabel label_1 = new JLabel("수량 :");
		label_1.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label_1.setBounds(195, 192, 44, 21);
		contentPanel.add(label_1);
		label_2.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label_2.setBounds(16, 254, 57, 15);
		
		contentPanel.add(label_2);
		st2C.setBounds(63, 248, 120, 30);
		
		contentPanel.add(st2C);
		label_3.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label_3.setBounds(195, 251, 44, 21);
		
		contentPanel.add(label_3);
		st2A.setHorizontalAlignment(SwingConstants.CENTER);
		st2A.setColumns(10);
		st2A.setBounds(245, 249, 44, 30);
		
		contentPanel.add(st2A);
		label_4.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label_4.setBounds(16, 311, 57, 15);
		
		contentPanel.add(label_4);
		st3C.setBounds(63, 305, 120, 30);
		
		contentPanel.add(st3C);
		label_5.setFont(new Font("맑은 고딕", Font.PLAIN, 15));
		label_5.setBounds(195, 308, 44, 21);
		
		contentPanel.add(label_5);
		st3A.setHorizontalAlignment(SwingConstants.CENTER);
		st3A.setColumns(10);
		st3A.setBounds(245, 306, 44, 30);
		
		contentPanel.add(st3A);
		getContentPane().add(buttonPane);

		setTitle("메뉴 추가");
		setModal(true);
		setBounds(700, 300, 323, 439);
		setResizable(false);
	}
}