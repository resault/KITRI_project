package com.kitri.Main.JoinMember;




import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.kitri.Main.frame.MainFrame;

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.Color;
import java.awt.SystemColor;


public class JoinMemberFrame extends JFrame {

	public JPanel contentPane;
	public JTextField tfName;
	public JTextField tfBirth;
	public JTextField tfAddress;
	public JTextField tfPhoneNum1;
	public JTextField tfPhoneNum2;
	public JTextField tfPhoneNum3;
	JoinMemberFrameController jmfc;
	MainFrame mf;
	
	/**
	 * Launch the application.
	 */
	

	/**
	 * Create the frame.
	 */
	public JoinMemberFrame(MainFrame mf) {
		this.mf = mf;
		jmfc = new JoinMemberFrameController(this);
		
		setBounds(500, 250, 490, 410);
		contentPane = new JPanel();
		contentPane.setBackground(Color.WHITE);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel labelName = new JLabel("이름");
		labelName.setBounds(42, 44, 57, 15);
		contentPane.add(labelName);
		
		JLabel labelBirth = new JLabel("생년월일");
		labelBirth.setBounds(42, 100, 57, 15);
		contentPane.add(labelBirth);
		
		JLabel labelAddress = new JLabel("주소");
		labelAddress.setBounds(42, 157, 57, 15);
		contentPane.add(labelAddress);
		
		JLabel labelPhoneNum = new JLabel("전화번호");
		labelPhoneNum.setBounds(42, 214, 57, 15);
		contentPane.add(labelPhoneNum);
		
		tfName = new JTextField();
		tfName.setBounds(147, 41, 116, 21);
		contentPane.add(tfName);
		tfName.setColumns(10);
		
		tfBirth = new JTextField();
		tfBirth.setBounds(147, 97, 116, 21);
		contentPane.add(tfBirth);
		tfBirth.setColumns(10);
		
		tfAddress = new JTextField();
		tfAddress.setBounds(147, 154, 286, 21);
		contentPane.add(tfAddress);
		tfAddress.setColumns(10);
		
		tfPhoneNum1 = new JTextField();
		tfPhoneNum1.setBounds(147, 211, 57, 21);
		contentPane.add(tfPhoneNum1);
		tfPhoneNum1.setColumns(10);
		
		tfPhoneNum2 = new JTextField();
		tfPhoneNum2.setColumns(10);
		tfPhoneNum2.setBounds(235, 211, 57, 21);
		contentPane.add(tfPhoneNum2);
		
		tfPhoneNum3 = new JTextField();
		tfPhoneNum3.setColumns(10);
		tfPhoneNum3.setBounds(325, 211, 57, 21);
		contentPane.add(tfPhoneNum3);
		
		JButton buttonJoinMember = new JButton("회원등록");
		buttonJoinMember.setForeground(SystemColor.controlLtHighlight);
		buttonJoinMember.setBackground(SystemColor.textHighlight);
		buttonJoinMember.setBounds(86, 298, 116, 37);
		contentPane.add(buttonJoinMember);
		
		JButton buttonCancel = new JButton("취소");
		buttonCancel.setForeground(SystemColor.controlLtHighlight);
		buttonCancel.setBackground(SystemColor.activeCaptionBorder);
		buttonCancel.setBounds(255, 298, 116, 37);
		contentPane.add(buttonCancel);
		
		JLabel lbBar = new JLabel("-");
		lbBar.setBounds(216, 214, 14, 15);
		contentPane.add(lbBar);
		
		JLabel label = new JLabel("-");
		label.setBounds(304, 214, 14, 15);
		contentPane.add(label);
		
		buttonJoinMember.addActionListener(jmfc);
		buttonCancel.addActionListener(jmfc);
	}
	
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					JoinMemberFrame frame = new JoinMemberFrame(mf);
//					frame.setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}
}
