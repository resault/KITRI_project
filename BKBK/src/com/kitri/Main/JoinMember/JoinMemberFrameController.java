package com.kitri.Main.JoinMember;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

import com.kitri.Main.frame.MainFrame;

public class JoinMemberFrameController implements ActionListener {

	JoinMemberFrame jmf;
	JoinMemberFrameService jmfs;

	public JoinMemberFrameController(JoinMemberFrame jmf) {
		this.jmf = jmf;
		jmfs = new JoinMemberFrameService(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		String str = e.getActionCommand();
		if (str.equals("ȸ�����")) {
			jmProcess();
		} else if (str.equals("���")) {
			jmfs.clear();
			jmf.dispose();
		} else if (ob == jmf.tfName) {
			if (jmf.mf.mc.mfs.isNotNumber(jmf.tfName.getText()) && !jmf.mf.mc.mfs.isNumber(jmf.tfName.getText())) {
				jmf.tfBirth.requestFocus();
			} else {
				JOptionPane.showMessageDialog(jmf, "�̸��� �ѱ��̳� �������� ���ּ���. ��ĭ�� �ȵ˴ϴ�.(��ȣ)");
				jmf.tfName.setText("");
			}
		} else if (ob == jmf.tfBirth) {
			String a = jmf.tfBirth.getText();
			if (jmf.mf.mc.mfs.isNumber(a) && a.length() < 7 && a.length() > 5) {
				jmf.tfAddress.requestFocus();
			} else {
				JOptionPane.showMessageDialog(jmf, "��������� 6�ڸ� ���ڸ� �Է°����մϴ�.");
				jmf.tfBirth.setText("");
			}
		} else if (ob == jmf.tfAddress) {
			jmf.tfPhoneNum1.requestFocus();
		} else if (ob == jmf.tfPhoneNum1) {
			if (jmf.mf.mc.mfs.isNumber(jmf.tfPhoneNum1.getText()) == true) {
				jmf.tfPhoneNum2.requestFocus();
			} else {
				JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
				jmf.tfPhoneNum1.setText("");
			}
		} else if (ob == jmf.tfPhoneNum2) {
			if (jmf.mf.mc.mfs.isNumber(jmf.tfPhoneNum2.getText()) == true) {
				jmf.tfPhoneNum3.requestFocus();
			} else {
				JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
				jmf.tfPhoneNum2.setText("");

			}
		} else if (ob == jmf.tfPhoneNum3) {
			if (jmf.mf.mc.mfs.isNumber(jmf.tfPhoneNum3.getText()) == true) {
				jmProcess();
			} else {
				JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
				jmf.tfPhoneNum3.setText("");

			}

		}

	}

	private void jmProcess() {
		String name = jmf.tfName.getText();
		String birth = jmf.tfBirth.getText();
		String add = jmf.tfAddress.getText();
		String p1 = jmf.tfPhoneNum1.getText();
		String p2 = jmf.tfPhoneNum2.getText();
		String p3 = jmf.tfPhoneNum3.getText();
		if (jmf.mf.mc.mfs.isNotNumber(name) && !jmf.mf.mc.mfs.isNumber(name)) {
			String a = jmf.tfBirth.getText();
			if (jmf.mf.mc.mfs.isNumber(a) && a.length() < 7 && a.length() > 5) {
				if (jmf.mf.mc.mfs.isNumber(p1) == true) {
					if (jmf.mf.mc.mfs.isNumber(p2) == true) {
						if (jmf.mf.mc.mfs.isNumber(p3) == true) {
							int b = jmf.mf.dao.insertMember(jmf);
							if (b > 0) {
								JOptionPane.showMessageDialog(jmf, "ȸ����� ����!!!");
								jmfs.clear();
								jmf.setVisible(false);

							} else {
								JOptionPane.showMessageDialog(jmf, "ȸ����� ����...");
							}
						} else {
							JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
							jmf.tfPhoneNum3.setText("");
						}
					} else {
						JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
						jmf.tfPhoneNum2.setText("");
					}
				} else {
					JOptionPane.showMessageDialog(jmf, "��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
					jmf.tfPhoneNum1.setText("");
				}
			} else {
				JOptionPane.showMessageDialog(jmf, "��������� 6�ڸ� ���ڸ� �Է°����մϴ�.");
				jmf.tfBirth.setText("");
			}
		} else {
			JOptionPane.showMessageDialog(jmf, "�̸��� �ѱ��̳� �������� ���ּ���. ��ĭ�� �ȵ˴ϴ�(��ȣ)");
			jmf.tfName.setText("");
		}

		
	}
}
