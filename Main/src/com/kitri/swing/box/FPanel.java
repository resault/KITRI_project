package com.kitri.swing.box;

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.border.LineBorder;

import com.kitri.dto.Basket;
import com.kitri.managerframe.ManagerController;
import java.awt.SystemColor;
import java.util.*;

import javax.swing.UIManager;

public class FPanel extends JPanel {
		public long a;
		public boolean b = true;
		public Thread th;
		public ManagerController mc;
		public JLabel labelTime;
		public JLabel labelName;
		public JLabel labelPrice;
		public String mid="";
		public String startTime="";
		public String endTime="";
		public List<Basket> voucherDtoBasket;
		public List<Basket> foodDtoBasket;
		public List<Basket> bookDtoBasket;
		
		
		public FPanel(ManagerController mc) {
			setBackground(UIManager.getColor("MenuItem.background"));
			 this.mc = mc;
			setBorder(new LineBorder(SystemColor.activeCaptionBorder, 3));
			setLayout(null);
			
			voucherDtoBasket = new ArrayList<Basket>();
			foodDtoBasket = new ArrayList<Basket>();
			bookDtoBasket = new ArrayList<Basket>();
			
			labelName = new JLabel("");
			labelName.setForeground(SystemColor.text);
			labelTime = new JLabel("");
			labelTime.setForeground(SystemColor.text);
			labelName.setBounds(45, 10, 57, 15);
			add(labelName);
			
			labelTime.setBounds(81, 50, 57, 15);
			add(labelTime);
			
			labelPrice = new JLabel("");
			labelPrice.setForeground(SystemColor.text);
			labelPrice.setBounds(45, 125, 57, 15);
			add(labelPrice);
		}
}
