package project.kitri.food;

import javax.swing.border.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class FoodFrame extends JFrame{

	   public JPanel contentPane = new JPanel();;//기본panel
	   public JPanel mainPanel = new JPanel();//main panel
	   private JPanel panel_1 = new JPanel();//화면첫줄panel
	   private JLabel titleL;//화면첫줄panel의 title,date,time
	   private JLabel dateL;
	   private JLabel timeL;
	   
	   //////////////////////////////////////////////
	   //카테고리 버튼들
	   public JButton drinkBtn = new JButton("\uC74C\uB8CC");
	   public JButton snackBtn = new JButton("\uACFC\uC790");
	   public JButton noodleBtn = new JButton("\uB77C\uBA74");
	   public JButton instfoodBtn = new JButton("\uC74C\uC2DD");
	   
	   //메뉴판 panel
	   JPanel menuPanel;
	   //메뉴판 View
	   public DrinkView dv = new DrinkView();
	   public SnackView sv = new SnackView();
	   public NoodleView nv = new NoodleView();
	   public InstFoodView ifv = new InstFoodView();
	   
	   CardLayout card = new CardLayout();
	   //////////////////////////////////
	   //주문취소,완료버튼
	   JButton cancelBtn = new JButton("\uCDE8\uC18C");
	   JButton completeBtn = new JButton("\uC644\uB8CC");
	   ////////////////////////////////////
	   //주문list
	   public JPanel orderPanel = new JPanel();
	   public JScrollPane tableP;
	   public JTable listT;
	   public DefaultTableModel tM;
	   ///////////////////////////////////////////
	   //총금액 textfield
	   JTextField textField;
	   public JTextField sumprice;
	   //주문수정버튼
	   JButton plusBtn = new JButton("+");
	   JButton minusBtn = new JButton("-");
	   JButton oneCancel = new JButton("X");
	   JButton totalCancel = new JButton("\uC804\uCCB4 \uCDE8\uC18C");
	
	   ///////////////////////////////////////
	   //Event Controller
	   public FoodController foodController;
	   
	   
	   /**
	    * Create the frame.
	    */
	   public FoodFrame() {
	      /////////////////////////////////////////////////
	      //화면첫줄 : panel_1
	      titleL = new JLabel("//북크북크// 1호점"); //점포이름
	      titleL.setHorizontalAlignment(SwingConstants.CENTER);
	      titleL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
	      titleL.setToolTipText("");
	      titleL.setBorder(new LineBorder(new Color(200, 200, 200)));
	      
	      dateL = new JLabel(new SimpleDateFormat("yyyy/MM/dd").format(new Date())); //날짜
	      dateL.setBorder(new LineBorder(new Color(200, 200, 200)));
	      dateL.setHorizontalAlignment(SwingConstants.CENTER);
	      dateL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
	      
	      timeL = new JLabel(new SimpleDateFormat("HH:mm").format(new Date()) + "(현재시간)"); //시간
	      timeL.setBorder(new LineBorder(new Color(200, 200, 200)));
	      timeL.setHorizontalAlignment(SwingConstants.CENTER);
	      timeL.setFont(new Font("맑은 고딕 Semilight", Font.BOLD, 16));
	      
	      panel_1.setLayout(new GridLayout(0, 3, 0, 0));
	      panel_1.add(titleL);
	      panel_1.add(dateL);
	      panel_1.add(timeL);
	      
	      panel_1.setBorder(new LineBorder(SystemColor.scrollbar, 2));
	      panel_1.setBackground(SystemColor.controlHighlight);
	      panel_1.setBounds(0, 0, 1494, 35);
	      contentPane.add(panel_1);
	      
	      /////////////////////////////////////////////////////////////////
	      //main panel
	      mainPanel.setBackground(Color.WHITE);
	      mainPanel.setBounds(0, 36, 1494, 835); // 이 크기대로 패널 생성해서 cardLayout으로 구성~~
	      mainPanel.setLayout(null);
	      drinkBtn.setForeground(Color.WHITE);
	      drinkBtn.setBackground(Color.DARK_GRAY);
	      //////////////////////////////////////////////
	      //카테고리 버튼들
	      drinkBtn.setBounds(1374, 71, 97, 50);
	      mainPanel.add(drinkBtn);
	      drinkBtn.setFont(new Font("맑은 고딕", Font.BOLD, 20));
	      snackBtn.setForeground(Color.WHITE);
	      snackBtn.setBackground(Color.DARK_GRAY);
	      snackBtn.setBounds(1374, 131, 97, 50);
	      mainPanel.add(snackBtn);
	      snackBtn.setFont(new Font("맑은 고딕", Font.BOLD, 20));
	      noodleBtn.setForeground(Color.WHITE);
	      noodleBtn.setBackground(Color.DARK_GRAY);
	      noodleBtn.setBounds(1374, 191, 97, 50);
	      mainPanel.add(noodleBtn);
	      noodleBtn.setFont(new Font("맑은 고딕", Font.BOLD, 20));
	      instfoodBtn.setForeground(Color.WHITE);
	      instfoodBtn.setBackground(Color.DARK_GRAY);
	      instfoodBtn.setBounds(1374, 251, 97, 50);
	      mainPanel.add(instfoodBtn);
	      instfoodBtn.setFont(new Font("맑은 고딕", Font.BOLD, 20));
	      ///////////////////////////////////////////////
	      //menu판 버튼들 들어가는 panel : menuPanel
	      menuPanel = new JPanel();
	      menuPanel.setBounds(717, 67, 656, 583);
	            
	      menuPanel.setLayout(card);//menuPanel에 cardLayout 씌우기
	      
	      dv.setLocation(715, 67);//각 카테고리 panel
	      menuPanel.add("drinkview",dv);
	      sv.setLocation(715, 67);
	      menuPanel.add("snackview",sv);
	      nv.setLocation(715, 67);
	      menuPanel.add("noodleview",nv);
	      ifv.setLocation(715, 67);
	      menuPanel.add("instfoodview",ifv);
	      
	      card.show(menuPanel, "drinkview");//첫페이지에 보이는 panel : drink
	      
	      mainPanel.add(menuPanel);
	      //////////////////////////////////////////////
	      //주문 취소,완료 버튼
	      cancelBtn.setForeground(Color.WHITE);
	      cancelBtn.setBackground(new Color(52, 152, 219));
	      cancelBtn.setBounds(883, 708, 235, 47);
	      cancelBtn.setFont(new Font("맑은 고딕", Font.BOLD, 30));
	      mainPanel.add(cancelBtn);
	      
	      completeBtn.setForeground(Color.WHITE);
	      completeBtn.setBackground(new Color(52, 152, 219));
	      completeBtn.setBounds(1138, 708, 235, 47);
	      completeBtn.setFont(new Font("맑은 고딕", Font.BOLD, 30));
	      mainPanel.add(completeBtn);
	      //////////////////////////////////////
	      //주문list
	      orderPanel.setBounds(48, 67, 630, 583);
	      orderPanel.setLayout(new BorderLayout(0, 0));
	      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	      //Jtable
	      //컬럼 명
	      Vector<String> column1 = new Vector<String>();
	      column1.addElement("No");

	      column1.addElement("카테고리");
	      column1.addElement("메뉴");
	      column1.addElement("수량");
	      column1.addElement("가격");
	      
	      //추가한 컬럼명으로 모델 생성하고 인자 넣음
	      tM = new DefaultTableModel(column1, 0);
//	      boolean tt = tM.isCellEditable(0, column1);
	      
	      
	      //JTable에 넣음.
	      listT = new JTable(tM);
	      listT.setFillsViewportHeight(true);
	      
	      //table 부착
	      tableP = new JScrollPane(listT);
	      orderPanel.add(tableP);
	      
	      
	      mainPanel.add(orderPanel);
	      ///!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	      
	      textField = new JTextField();
	      textField.setBackground(new Color(52, 152, 219));
	      textField.setForeground(Color.WHITE);
	      textField.setHorizontalAlignment(SwingConstants.CENTER);
	      textField.setText("\uCD1D\uAE08\uC561");
	      textField.setBounds(48, 681, 225, 37);
	      mainPanel.add(textField);
	      textField.setColumns(10);
	      textField.setFont(new Font("맑은 고딕", Font.BOLD, 25));
	      //총금액
	      sumprice = new JTextField();
	      sumprice.setText("0");
	      sumprice.setHorizontalAlignment(SwingConstants.CENTER);
	      sumprice.setBounds(48, 718, 225, 37);
	      mainPanel.add(sumprice);
	      sumprice.setColumns(10);
	      sumprice.setFont(new Font("맑은 고딕", Font.BOLD, 30));
	      plusBtn.setForeground(Color.WHITE);
	      plusBtn.setBackground(Color.DARK_GRAY);
	      
	      plusBtn.setBounds(285, 680, 75, 75);
	      mainPanel.add(plusBtn);
	      plusBtn.setFont(new Font("맑은 고딕", Font.BOLD, 40));
	      minusBtn.setForeground(Color.WHITE);
	      minusBtn.setBackground(Color.DARK_GRAY);
	      minusBtn.setBounds(372, 680, 75, 75);
	      mainPanel.add(minusBtn);
	      minusBtn.setFont(new Font("맑은 고딕", Font.BOLD, 40));
	      oneCancel.setForeground(Color.WHITE);
	      oneCancel.setBackground(Color.DARK_GRAY);
	      oneCancel.setBounds(459, 680, 75, 75);
	      mainPanel.add(oneCancel);
	      oneCancel.setFont(new Font("맑은 고딕", Font.BOLD, 30));
	      totalCancel.setForeground(Color.WHITE);
	      totalCancel.setBackground(Color.DARK_GRAY);
	      totalCancel.setBounds(546, 680, 132, 75);
	      mainPanel.add(totalCancel);
	      totalCancel.setFont(new Font("맑은 고딕", Font.BOLD, 20));
	      //////////////////////////////////////
	      
	     
	      contentPane.add(mainPanel);
	      
	      contentPane.setLayout(null);
	      setContentPane(contentPane);
	      setBounds(100, 100, 1500, 900);
	      setResizable(false);
	      setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	      
	      /////////////////////////////
	      //Event Listener
	      foodController = new FoodController(this);
	      
	      drinkBtn.addActionListener(foodController);
	      snackBtn.addActionListener(foodController);
	      noodleBtn.addActionListener(foodController);
	      instfoodBtn.addActionListener(foodController);
	      
	      plusBtn.addActionListener(foodController);
	      minusBtn.addActionListener(foodController);
	      oneCancel.addActionListener(foodController);
	      totalCancel.addActionListener(foodController);
	      
	      cancelBtn.addActionListener(foodController);
	      completeBtn.addActionListener(foodController);
	      
	      //DrinkView 
	      int drinklen = dv.drinkbtn.length;
	      for(int i=0;i<drinklen;i++) {
	    	   dv.drinkbtn[i].addActionListener(foodController);
	      }
	      //SnackView
	      int snacklen = sv.snackbtn.length;
	      for(int i=0;i<snacklen;i++) {
	    	   sv.snackbtn[i].addActionListener(foodController);
	      }
	      //NoodleView
	      int noodlelen = nv.noodlebtn.length;
	      for(int i=0;i<noodlelen;i++) {
	    	   nv.noodlebtn[i].addActionListener(foodController);
	      }
	      //InstFoodView
	      int instlen = ifv.instfoodbtn.length;
	      for(int i=0;i<instlen;i++) {
	    	  ifv.instfoodbtn[i].addActionListener(foodController);
	      }
	      
	      
	     
	      
	      ////////////////////////////////
	   }
	    
	  
	   

	   /**
	    * Launch the application.
	    */
	   public static void main(String[] args) {
	      EventQueue.invokeLater(new Runnable() {
	         public void run() {
	            try {
	               FoodFrame frame = new FoodFrame();
	               frame.setVisible(true);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	         }
	      });
	   }
}
