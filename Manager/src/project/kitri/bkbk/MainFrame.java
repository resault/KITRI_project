package project.kitri.bkbk;

// BKBK 메인프레임

// TODO 세현's 작업 여기에 

import javax.swing.border.*;

import project.kitri.bkbk.manager.main.MgmtMain;

import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainFrame extends JFrame {

	private JPanel contentPane = new JPanel();;
	public JPanel cardP = new JPanel();//각 페이지로 넘어가는 CardLayout 적용 패녈
	private JPanel panel_1 = new JPanel();
	private JLabel titleL;
	private JLabel dateL;
	private JLabel timeL;
	public CardLayout cards = new CardLayout();
	public JButton aa = new JButton("관리자");//test용
	public Panel test = new Panel();//test용

	MgmtMain mgmtMain = new MgmtMain();
	MainFrameController mFC;
	
	/**
	 * Create the frame.
	 */
	public MainFrame() {
		mFC = new MainFrameController(this);
		
		
		//화면 첫번째 줄의 날짜 및 시간 표시_Label
		titleL = new JLabel("//북크북크// 1호점"); //점포이름
		titleL.setHorizontalAlignment(SwingConstants.CENTER);
		titleL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
		titleL.setToolTipText("");
		titleL.setBorder(new LineBorder(new Color(200, 200, 200)));
		
		dateL = new JLabel(new SimpleDateFormat("yyyy/MM/dd").format(new Date())); //날짜
		dateL.setBorder(new LineBorder(new Color(200, 200, 200)));
		dateL.setHorizontalAlignment(SwingConstants.CENTER);
		dateL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
		
		timeL = new JLabel(new SimpleDateFormat("HH:mm:ss").format(new Date()) + "(현재시간)"); //시간
		timeL.setBorder(new LineBorder(new Color(200, 200, 200)));
		timeL.setHorizontalAlignment(SwingConstants.CENTER);
		timeL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
		
		
		panel_1.setLayout(new GridLayout(0, 3, 0, 0));
		panel_1.setBorder(new LineBorder(SystemColor.scrollbar, 2));
		panel_1.setBackground(SystemColor.controlHighlight);
		panel_1.setBounds(0, 0, 1494, 35);
		panel_1.add(titleL);
		panel_1.add(dateL);
		panel_1.add(timeL);

		
		//페이지 panel
		contentPane.setLayout(null);
		cardP.setBounds(0, 36, 1494, 835); // 이 크기대로 패널 생성해서 cardLayout으로 구성~~
		
		cardP.setLayout(cards);//CardLayout 적용
		cardP.add("test", test);
		test.add(aa);
		cardP.add("관리자 Main", mgmtMain);//관리자 메인 panel
//		cards.show(cardP, "관리자Main");
		cards.show(cardP, "test");

		contentPane.add(cardP);
		contentPane.add(panel_1);
		
		setContentPane(contentPane);
		setBounds(100, 100, 1500, 900);
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		
//----------------------------------------------------------------------------------------------------------------------이벤트 등록
		
		aa.addActionListener(mFC);

	}
	
	
	 
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainFrame frame = new MainFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

}
