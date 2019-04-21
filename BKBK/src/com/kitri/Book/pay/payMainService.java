package com.kitri.Book.pay;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JOptionPane;

public class payMainService implements ActionListener {
	boolean clearOnNextDigit;
	int displayMode;
	int INPUT_MODE = 0;
	String lastOperator;
	double lastNumber;

	payMain p;
	
	String a;
	public payMainService(payMain payMain) {
		p = payMain;
	}

	public void goComplex() { // ���հ���
		
		for (int i = 0; i < p.card.buttons.length; i++) {
			p.card.buttons[i].addActionListener(this);  }
		p.card.confirm.addActionListener(this);
		p.card.cancle.addActionListener(this);
		
		p.cash.setLocation(500,500);
		p.cash.setVisible(true);
	}


	public void goCard() { // ī�����
		p.card.sum.setText(p.payR.getText()); // �����ݾ��� card�� �Ѿ����
		for (int i = 0; i < p.card.buttons.length; i++) 
			p.card.buttons[i].addActionListener(this);
		p.card.confirm.addActionListener(this);
		p.card.cancle.addActionListener(this);
	}

	/**
    * ActionEvent
    */
   @Override
   public void actionPerformed(ActionEvent e) {
      Object ob = e.getSource();
      String str = e.getActionCommand();
      
      int len = p.card.buttons.length;
      for (int i = 0; i < len; i++) {
			if (ob == p.card.buttons[i]) {
				if (i <= 8) {
					number(i);
					break;
				} else {
					switch (i) {
					case 9: 
						String a = p.card.sum.getText() + "0";
						p.card.sum.setText(a);
						break;
					case 10: 
						String b = p.card.sum.getText() + "00";
						p.card.sum.setText(b);
						break;
					case 11: 
						clearAll();
						break;
					case 12:
					
					case 13: // Ȯ��
						System.out.println("�ʴ�");
						p.card.setVisible(false);
						break; 
					}}}} 
				

           if (ob == p.card.cancle) {
            p.card.setVisible(false);
         } else if (ob == p.card.confirm) { // ������ȸ Button
        	 
            p.card.setLocation(500, 400);
            p.card.cardNumber.setText("1234-5678-4123");
            p.card.setVisible(true);

            int s = Integer.parseInt(p.card.sum.getText());

            int total = Integer.parseInt(p.totalR.getText());
            int discount = Integer.parseInt(p.discountR.getText());
            int pay = total - discount;
            
            
            
            p.givenR.setText(p.card.sum.getText());
            GoPayMain();
            JOptionPane.showMessageDialog(null, "[���οϷ�] " + s + "�� �����Ǿ����ϴ�.");
            p.card.setVisible(false);
            p.payR.setForeground(Color.red);
            p.payR.setText(a.valueOf(Integer.parseInt(p.payR.getText()) - Integer.parseInt(p.givenR.getText())));
//            p.changeR.setText("������� �ʽ��ϴ�.");
//			p.changeR.setForeground(Color.red);
//            p.mf.m
         } 
   }
   
  
            


	private void GoPayMain() { // from Card
		int total = Integer.parseInt(p.totalR.getText());
		int discount = Integer.parseInt(p.discountR.getText());
		int pay = total - discount;
		int given = Integer.parseInt(p.card.sum.getText()); // ī��, ���� �����ؾ�
		int change = given - pay;

		p.payR.setText(String.valueOf(pay));
		p.givenR.setText(String.valueOf(given));
		if (change <= 0) {
			//p.changeR.setText("������� �ʽ��ϴ�.");
			//p.changeR.setForeground(Color.red);
		} else
			p.changeR.setText(String.valueOf(change));

	}

	private void clearAll() {
		p.cash.moneyL.setText("0");
		p.card.sum.setText("0");
		lastOperator = "0";
		lastNumber = 0;
		displayMode = INPUT_MODE;
		clearOnNextDigit = true;
	}

	private void number(int i) {
		String inputString = p.card.sum.getText();

		// null
		if (clearOnNextDigit)
			p.card.sum.setText("");

		if (inputString.indexOf("0") == 0)
			inputString = inputString.substring(1);

		if ((!inputString.equals("0") || i > 0)) {
			p.card.sum.setText(inputString + (i + 1));
			p.cash.moneyL.setText(inputString + i);
		}

		displayMode = INPUT_MODE;
		clearOnNextDigit = false;
	}



}