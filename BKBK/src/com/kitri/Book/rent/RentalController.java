package com.kitri.Book.rent;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Iterator;
import java.util.Vector;

import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class RentalController implements ActionListener {
   
   public RentalMain rm;
   public RentalService rs;

   public RentalController(RentalMain r) {
      this.rm = r;
      rs = new RentalService(rm);
   }

   @Override
   public void actionPerformed(ActionEvent e) {
      Object ob = e.getSource();
      
      if(ob == rm.search) { 
         if (rm.searchTF.getText().trim().equals("")) 
            JOptionPane.showMessageDialog(null, "[�˸�] �˻�� �Է��ϼ���.");
         else if(ob == rm.search) {// �˻�� �Է��������
            String searchStr = rm.searchTF.getText().trim();// ã�� ����
             rs.searchData(searchStr);
             rm.searchTF.setText("");
              } 
         
         } else if(ob == rm.change) { // db�� ��ü��� 0���� 1�� change
            JOptionPane.showMessageDialog(null, "[�˸�] �ش� å�� ��ü��� ó���Ǿ����ϴ�.");
            
         } else if(ob == rm.move) {
        	 rs.MoveToList();
         } else if(ob == rm.cancle) {
        	 String tmp = rm.bookL.getSelectedItem();
        	 rm.bookL.remove(tmp);
         } else if(ob == rm.basket) {
        	 rs.makeBasket();
        	 rm.setVisible(false);
		}
   	}
}