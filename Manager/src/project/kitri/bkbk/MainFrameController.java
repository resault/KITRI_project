package project.kitri.bkbk;

// BKBK main controller
// - 세현's 이벤트 관리
// - 각 서비스 페이지로 넘기기까지

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
			mf.cards.show(mf.cardP, "관리자 Main");
			mf.mgmtMain.mmc.mms.setMenuB("음료");
			mf.mgmtMain.mmc.mms.setStockT("음료");
		}
			
	}

}
