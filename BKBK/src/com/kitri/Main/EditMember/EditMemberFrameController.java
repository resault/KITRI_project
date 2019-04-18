package com.kitri.Main.EditMember;

import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.kitri.Main.frame.*;
import com.kitri.Main.memberDto.*;
public class EditMemberFrameController implements ActionListener {
	EditMemberFrame emf;
	EditMemberFrameService emfs;
	
	public EditMemberFrameController(EditMemberFrame emf) {
		this.emf = emf;
		emfs = new EditMemberFrameService(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		String str = e.getActionCommand();
		if (str.equals("회원정보수정")) {
				int a = emf.mf.dao.editMember(emf);
				if (a > 0) {
					int len = emf.mf.fp.length;
					for (int i = 0; i < len; i++) {
					
						System.out.println(MainFrame.ID);
						if (emf.mf.fp[i].mid.equals(MainFrame.ID)) {
							emf.mf.fp[i].mid = emf.mf.dao.newID;
							emf.mf.vt.remove(emf.mf.fp[i].mid);
							emf.mf.vt.add(emf.mf.dao.newID);
							break;
						}
					}
					JOptionPane.showMessageDialog(emf, "회원정보수정 성공!!!");
					emf.mf.mc.mfs.logout();
					emf.emfc.emfs.clear();
					emf.setVisible(false);
				} else {
					JOptionPane.showMessageDialog(emf, "회원정보수정 실패...");
				}
		}else if (str.equals("취소")) {
			emf.mf.mc.mfs.logout();
			emf.emfc.emfs.clear();
			emf.setVisible(false);
				
		} else if (ob == emf.tfName) {
			if (emf.mf.mc.mfs.isNumber(emf.tfName.getText())==false) {
				emf.tfEAdd.requestFocus();
			} else {
				JOptionPane.showMessageDialog(emf,"이름엔 숫자 입력이 되지 않습니다.");
				emf.tfName.setText("");
			}
		} else if (ob == emf.tfEAdd) {
				emf.tfEP1.requestFocus();
		} else if (ob == emf.tfEP1) {
			if (emf.mf.mc.mfs.isNumber(emf.tfEP1.getText())==true) {
				emf.tfEP2.requestFocus();
			} else {
				JOptionPane.showMessageDialog(emf,"전화번호는 숫자만 입력가능합니다.");
				emf.tfEP1.setText("");
			}
		} else if (ob == emf.tfEP2) {
			if (emf.mf.mc.mfs.isNumber(emf.tfEP2.getText())==true) {
				emf.tfEP3.requestFocus();
			} else {
				JOptionPane.showMessageDialog(emf,"전화번호는 숫자만 입력가능합니다.");
				emf.tfEP2.setText("");
			}
		} else if (ob == emf.tfEP3) {
			if (emf.mf.mc.mfs.isNumber(emf.tfEP3.getText())==true) {
				emf.buttonEM.requestFocus();
			} else {
				JOptionPane.showMessageDialog(emf,"전화번호는 숫자만 입력가능합니다.");
				emf.tfEP3.setText("");
				
			}
		}
		
	}

}
