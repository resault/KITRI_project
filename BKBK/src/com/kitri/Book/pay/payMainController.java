package com.kitri.Book.pay;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import com.kitri.Main.swing.box.FPanel;

public class payMainController implements ActionListener {

		   payMain p;
		   payMainService pms;
		   
		   public payMainController(payMain payMain) {
		      this.p = payMain;
//		      pms = new payMainService(p);
		      pms = new payMainService(this);
		   }

		   @Override
		   public void actionPerformed(ActionEvent e) {
		      
		      String str = e.getActionCommand(); // 왜 Object는 안먹힐까?
		      Object ob = e.getSource();
		      
		      if (ob == p.cardB) {
		         pms.goCard();
		         p.card.setLocation(500, 400);
		         p.card.setVisible(true);
		      } else if (ob == p.cashB) {
		         p.cash.setLocation(450, 300);
		         p.cash.setVisible(true);
		      } else if (ob == p.cardCashB) {
		    	  pms.goComplex();
		    	  p.card.confirm.setText("복합결제");
		          p.card.setLocation(500, 400);
		          p.card.setVisible(true);
		      } else if (ob == p.homeB) {
		    	  allclear();
		    	  p.mf.serCard.show(p.mf.panelCard, "Main");
		   }
	}

	private void allclear() {
		p.model.setNumRows(0);
		p.givenR.setText("");
		p.changeR.setText("");
		p.payR.setText("");
		p.discountR.setText("");
		
	}

	private void buttonMinusProcess() {
		int a = p.jTable.getSelectedRow();
		if (a == -1) {
			return;
		} else {
			Object ob = p.jTable.getValueAt(a, 1);
			String str = String.valueOf(ob);
			FPanel f = p.mf.mc.mfs.findFp();
			switch (str) {
			case "이용권":
				pms.bMProcess(a, f, f.voucherDtoBasket);
				break;
			case "음식":
				pms.bMProcess(a, f, f.foodDtoBasket);
				break;
			case "도서":
				pms.bMProcess(a, f, f.bookDtoBasket);
				break;
			}
		}
	}

}