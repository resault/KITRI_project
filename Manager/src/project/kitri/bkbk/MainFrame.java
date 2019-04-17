package project.kitri.bkbk;

// BKBK ����������

// TODO ����'s �۾� ���⿡ 

import javax.swing.border.*;

import project.kitri.bkbk.manager.main.MgmtMain;

import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainFrame extends JFrame {

	private JPanel contentPane = new JPanel();;
	public JPanel cardP = new JPanel();//�� �������� �Ѿ�� CardLayout ���� �г�
	private JPanel panel_1 = new JPanel();
	private JLabel titleL;
	private JLabel dateL;
	private JLabel timeL;
	public CardLayout cards = new CardLayout();
	public JButton aa = new JButton("������");//test��
	public Panel test = new Panel();//test��

	MgmtMain mgmtMain = new MgmtMain();
	MainFrameController mFC;
	
	/**
	 * Create the frame.
	 */
	public MainFrame() {
		mFC = new MainFrameController(this);
		
		
		//ȭ�� ù��° ���� ��¥ �� �ð� ǥ��_Label
		titleL = new JLabel("//��ũ��ũ// 1ȣ��"); //�����̸�
		titleL.setHorizontalAlignment(SwingConstants.CENTER);
		titleL.setFont(new Font("���� ��� Semilight", Font.BOLD, 16));
		titleL.setToolTipText("");
		titleL.setBorder(new LineBorder(new Color(200, 200, 200)));
		
		dateL = new JLabel(new SimpleDateFormat("yyyy/MM/dd").format(new Date())); //��¥
		dateL.setBorder(new LineBorder(new Color(200, 200, 200)));
		dateL.setHorizontalAlignment(SwingConstants.CENTER);
		dateL.setFont(new Font("���� ��� Semilight", Font.BOLD, 16));
		
		timeL = new JLabel(new SimpleDateFormat("HH:mm:ss").format(new Date()) + "(����ð�)"); //�ð�
		timeL.setBorder(new LineBorder(new Color(200, 200, 200)));
		timeL.setHorizontalAlignment(SwingConstants.CENTER);
		timeL.setFont(new Font("���� ��� Semilight", Font.BOLD, 16));
		
		
		panel_1.setLayout(new GridLayout(0, 3, 0, 0));
		panel_1.setBorder(new LineBorder(SystemColor.scrollbar, 2));
		panel_1.setBackground(SystemColor.controlHighlight);
		panel_1.setBounds(0, 0, 1494, 35);
		panel_1.add(titleL);
		panel_1.add(dateL);
		panel_1.add(timeL);

		
		//������ panel
		contentPane.setLayout(null);
		cardP.setBounds(0, 36, 1494, 835); // �� ũ���� �г� �����ؼ� cardLayout���� ����~~
		
		cardP.setLayout(cards);//CardLayout ����
		cardP.add("test", test);
		test.add(aa);
		cardP.add("������ Main", mgmtMain);//������ ���� panel
//		cards.show(cardP, "������Main");
		cards.show(cardP, "test");

		contentPane.add(cardP);
		contentPane.add(panel_1);
		
		setContentPane(contentPane);
		setBounds(100, 100, 1500, 900);
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		
//----------------------------------------------------------------------------------------------------------------------�̺�Ʈ ���
		
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
