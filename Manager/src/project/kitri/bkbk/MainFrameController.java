package project.kitri.bkbk;

// BKBK main controller
// - ����'s �̺�Ʈ ����
// - �� ���� �������� �ѱ�����

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrameController implements ActionListener{

	MainFrame mf;
	
	public MainFrameController(MainFrame mf) {
		this.mf = mf;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		if(ob == mf.aa) {
			mf.cards.show(mf.cardP, "������ Main");
			mf.mgmtMain.mmc.mms.setMenuB("����");
			mf.mgmtMain.mmc.mms.setStockT("����");
		}
			
	}

}
