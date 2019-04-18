package com.kitri.Statistics.chart;


import java.awt.Font;

import javax.swing.*;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

//import com.kitri.jfreechart.*;

import com.kitri.Statistics.StatMemberDto;

import java.awt.Color;
import java.awt.Component;
import java.awt.Choice;
import java.awt.Rectangle;
import java.util.Vector;
import java.awt.ComponentOrientation;
import java.awt.Cursor;
import java.awt.Point;
import java.awt.Dimension;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ChartMember extends JPanel {

//	private static final Component BarChartBean = null;

	public static Vector<String> column1 = new Vector<String>();
	public Vector<String> rows = new Vector<String>();
	public static DefaultTableModel model;

	public static JPanel chartpanel;

	public ChartMember() {
		
		setBackground(Color.WHITE);
		setBorder(new LineBorder(new Color(0, 0, 0)));
		setLayout(null);
		setBounds(203, 49, 1240, 713);

		JLabel lblNewLabel = new JLabel("\uC5F0\uB839\uBCC4 \uD68C\uC6D0 \uBD84\uD3EC\uB3C4");
		lblNewLabel.setFont(new Font("����", Font.BOLD, 30));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(473, 58, 319, 37);
		add(lblNewLabel);

		// 3) ��Ʈ�� ���� J�г� �����ϱ�
		chartpanel = new JPanel();
		chartpanel.setBackground(Color.WHITE);
		chartpanel.setBorder(new LineBorder(new Color(0, 0, 0)));
		chartpanel.setBounds(50, 142, 560, 522);
		chartpanel.setLayout(null);

		// 5) J�г��� �����ӿ� ���̱�
		add(chartpanel);

		
		// �÷����� ������ش�.
		column1.addElement("ȸ��ID");
		column1.addElement("�̸�");
		column1.addElement("����");
		column1.addElement("���ɴ�");
		
		
		// �߰��� �÷������� �� �����ϰ� ���ڷ� �־���
		model = new DefaultTableModel(column1, 0);

		// �߰��� �����͵��� �𵨿� �߰��ϰ� ���� ���̺� ���ڷ� �־��ش�.
		JTable table = new JTable(model);
		table.setGridColor(Color.GRAY);
		table.setBackground(Color.WHITE);
		table.setForeground(Color.BLACK);
		JScrollPane jScollPane = new JScrollPane(table);
		add(jScollPane);
		jScollPane.setBorder(new LineBorder(new Color(130, 135, 144)));
		jScollPane.setViewportView(table);

		jScollPane.setBackground(Color.WHITE);
		jScollPane.setPreferredSize(new Dimension(560, 450));
		jScollPane.setBounds(622, 142, 560, 520);
		jScollPane.setForeground(Color.WHITE);

		table.setFillsViewportHeight(true);

	}

	public static void search() {

		System.out.println("�Ϻ� ��ȸ ��ư�� ���Ƚ��ϴ�.");
	

		// ******************dao �Լ� ��� ����****************************
		StatDao dao = new StatDao();

		Vector<StatMemberDto> list = new Vector<StatMemberDto>();

		list = dao.selectMemberRanking();

		int size = list.size();

		for (int i = 0; i < size; i++) {
			Vector<String> rows = new Vector<String>();
			rows.addElement(list.get(i).getMemberId());
			rows.addElement(list.get(i).getName());
			rows.addElement(list.get(i).getBirth());
			rows.addElement(list.get(i).getAge());

			model.addRow(rows);
			createChart();
		}
	}

	public static JFreeChart createChart() {
//		public static ChartPanel createChart() {

		DefaultPieDataset pieDataset = new DefaultPieDataset();

		StatDao dao = new StatDao();

		Vector<StatMemberDto> list = new Vector<StatMemberDto>();

		list = dao.rankingGraph();

		Vector<String> customerAge = new Vector<String>(); // 10��
		Vector<Integer> customerAgeCount = new Vector<Integer>(); // 2

		// �� ����
		int size = list.size();
		for (int i = 0; i < size; i++) {

			customerAge.addElement(list.get(i).getCustomerAge());
			customerAgeCount.addElement(list.get(i).getCustomerAgeCount());

			// ��, ����, ī�װ� ����
			pieDataset.setValue(customerAge.get(i), customerAgeCount.get(i));
		}

		JFreeChart chart = ChartFactory.createPieChart3D("���ɺ� ���", pieDataset, false, true, true);

		chart.getTitle().setFont(new Font("�������", Font.BOLD, 25)); // ��Ʈ ���� ��Ʈ

		PiePlot3D p = (PiePlot3D) chart.getPlot();
		p.setLabelFont(new Font("�������", Font.BOLD, 15)); // ��Ʈ ���� ��Ʈ
		p.setForegroundAlpha(0.7f);
		p.setBackgroundPaint(Color.lightGray);

		return chart;

	}
}
