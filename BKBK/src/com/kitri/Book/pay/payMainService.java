package com.kitri.Book.pay;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.List;

import javax.swing.JOptionPane;

import com.kitri.Main.dto.Basket;
import com.kitri.Main.swing.box.FPanel;

public class payMainService implements ActionListener {
	boolean clearOnNextDigit;
	int displayMode;
	int INPUT_MODE = 0;
	String lastOperator;
	double lastNumber;

	public payMainController pc;

	String a;
	public payMainService(payMainController payMainController) {
		pc = payMainController;
	}

	public void goComplex() { // 복합결제
		for (int i = 0; i < pc.p.card.buttons.length; i++) {
			pc.p.card.buttons[i].addActionListener(this);  }
		pc.p.card.confirm.addActionListener(this);
		pc.p.card.cancle.addActionListener(this);
		pc.p.cash.setLocation(500,500);
		pc.p.cash.setVisible(true);
	}


	public void goCard() { // 카드결제
		pc.p.card.sum.setText(pc.p.payR.getText()); // 결제금액이 card로 넘어오기
		for (int i = 0; i < pc.p.card.buttons.length; i++) 
			pc.p.card.buttons[i].addActionListener(this);
		pc.p.card.confirm.addActionListener(this);
		pc.p.card.cancle.addActionListener(this);
	}

	/**
    * ActionEvent
    */
   @Override
   public void actionPerformed(ActionEvent e) {
      Object ob = e.getSource();
      String str = e.getActionCommand();
      
      int len = pc.p.card.buttons.length;
      for (int i = 0; i < len; i++) {
			if (ob == pc.p.card.buttons[i]) {
				if (i <= 8) {
					number(i);
					break;
				} else {
					switch (i) {
					case 9: 
						String a = pc.p.card.sum.getText() + "0";
						pc.p.card.sum.setText(a);
						break;
					case 10: 
						String b = pc.p.card.sum.getText() + "00";
						pc.p.card.sum.setText(b);
						break;
					case 11: 
						clearAll();
						break;
					case 12:
					
					case 13: // 확인
						System.out.println("너니");
						pc.p.card.setVisible(false);
						break; 
					}}}} 
				

           if (ob == pc.p.card.cancle) {
            pc.p.card.setVisible(false);
         } else if (ob == pc.p.card.confirm) { // 승인조회 Button
            pc.p.card.setLocation(500, 400);
            pc.p.card.cardNumber.setText("1234-5678-4123");
            pc.p.card.setVisible(true);

            int s = Integer.parseInt(pc.p.card.sum.getText());

            int total = Integer.parseInt(pc.p.totalR.getText());
            int discount = Integer.parseInt(pc.p.discountR.getText());
            int pay = total - discount;
            
            pc.p.givenR.setText(pc.p.card.sum.getText());
            GoPayMain();
            JOptionPane.showMessageDialog(null, "[승인완료] " + s + "원 결제되었습니다.");
            pc.p.card.setVisible(false);
            pc.p.payR.setForeground(Color.red);
            pc.p.payR.setText(a.valueOf(Integer.parseInt(pc.p.payR.getText()) - Integer.parseInt(pc.p.givenR.getText())));
            pc.p.changeR.setText("충분하지 않습니다.");
			pc.p.changeR.setForeground(Color.red);
            
            // main으로 ㄱㄱ
         } 
   }
   
   public void bMProcess(int a, FPanel f, List<Basket> b) {
		Object ob1 = pc.p.jTable.getValueAt(a, 2);
		String str1 = String.valueOf(ob1);
		Object ob2 = pc.p.jTable.getValueAt(a, 4);
		int t = Integer.parseInt(String.valueOf(ob2));
		int len = b.size();
		if (t == 1) {
			for (int i = 0; i < len; i++) {
				if (b.get(i).toString().equals(str1)) {
					b.remove(i);
					pc.p.model.setNumRows(0);
					pc.p.mf.mc.mfs.appendingPayment(f);
					pc.p.mf.mc.tatalPrice();
					break;
				}
			}

		} else {
			for (int i = 0; i < len; i++) {
				if (b.get(i).toString().equals(str1)) {
					Basket basket = b.get(i);
					int c = basket.getCount();
					basket.setCount(c - 1);
					pc.p.model.setNumRows(0);
					pc.p.mf.mc.mfs.appendingPayment(f);
					pc.p.mf.mc.tatalPrice();
					break;

				}
			}
		}
	}
            


	private void GoPayMain() { // from Card
		int total = Integer.parseInt(pc.p.totalR.getText());
		int discount = Integer.parseInt(pc.p.discountR.getText());
		int pay = total - discount;
		int given = Integer.parseInt(pc.p.card.sum.getText()); // 카드, 현금 구별해야
		int change = given - pay;

		pc.p.payR.setText(String.valueOf(pay));
		pc.p.givenR.setText(String.valueOf(given));
		if (change <= 0) {
			//p.changeR.setText("충분하지 않습니다.");
			//p.changeR.setForeground(Color.red);
		} else
			pc.p.changeR.setText(String.valueOf(change));

	}

	private void clearAll() {
		pc.p.cash.moneyL.setText("0");
		pc.p.card.sum.setText("0");
		lastOperator = "0";
		lastNumber = 0;
		displayMode = INPUT_MODE;
		clearOnNextDigit = true;
	}

	private void number(int i) {
		String inputString = pc.p.card.sum.getText();

		// null
		if (clearOnNextDigit)
			pc.p.card.sum.setText("");

		if (inputString.indexOf("0") == 0)
			inputString = inputString.substring(1);

		if ((!inputString.equals("0") || i > 0)) {
			pc.p.card.sum.setText(inputString + (i + 1));
			pc.p.cash.moneyL.setText(inputString + i);
		}

		displayMode = INPUT_MODE;
		clearOnNextDigit = false;
	}



}