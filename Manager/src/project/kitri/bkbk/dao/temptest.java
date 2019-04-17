package project.kitri.bkbk.dao;

import java.sql.*;

import project.kitri.bkbk.data.FoodDto;

	public class temptest {
		private Connection conn;
		private ResultSet rs;
		private FoodDto fDto;
		private Statement stmt;
		private PreparedStatement pstmt;
		private String sql;
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "project1";
		String pw = "project1";
		
		// �̱��� 
		private static temptest instance = new temptest();//�ڽ��� ��ü��  ����
		private temptest() {}
		public static temptest getInstance() {//�ܺο��� Ŭ������.getInstance()�� ȣ���ϸ� �� Ŭ������ ��ü�� ��ȯ��
			String driver = "oracle.jdbc.driver.OracleDriver";
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			return instance;
		}
//	public void insertMenu() {//�޴� �߰�
//		conn = null;
//		pstmt = null;
//		sql = "insert into food values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//		try {
//			conn = DriverManager.getConnection(url, user, pw);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, "����7");
//			pstmt.setString(2, "����");
//			pstmt.setString(3, "������");
//			pstmt.setInt(4, 3000);
//			pstmt.setString(5, "����");
//			pstmt.setInt(6, 1);
//			pstmt.setString(7, null);
//			pstmt.setString(8, null);
//			pstmt.setString(9, null);
//			pstmt.setString(10, null);
////			pstmt.setString(1, (f.getFoodCtg() + countMenu()));
////			pstmt.setString(2, f.getFoodCtg());
////			pstmt.setString(3, f.getFoodName());
////			pstmt.setInt(4, f.getFoodPrice());
////			pstmt.setString(5, f.getStock1Name());
////			pstmt.setInt(6, f.getStock1Num());
////			pstmt.setString(7, f.getStock2Name());
////			pstmt.setInt(8, f.getStock2Num());
////			pstmt.setString(9, f.getStock3Name());
////			pstmt.setInt(10, f.getStock3Num());
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//				try {
//					if(rs!=null)
//						rs.close();
//					if(pstmt!=null)
//						pstmt.close();
//					if(conn!=null)
//						conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//		
//	}
		public void mergeMenu() {//�޴� �߰�&����
//			FoodDto f = foodDto;
			String num = String.format("%02d", 6);
			conn = null;
			pstmt = null;
			sql = "merge into food" + 
					" using dual" + 
					" on (food_name = ?)" + 
					" when matched then" + 
					" update set food_ctg = ?, food_price = ?, stock1_name = ?, stock1_num = ?," +
					" stock2_name = ?, stock2_num = ?, stock3_name = ?, stock3_num = ?" + 
					" when not matched then" + 
					" insert values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				conn = DriverManager.getConnection(url, user, pw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "�Ƹ޸�ī��");
				pstmt.setString(2, "����");//��ġ�ϴ� �̸� �ִ� ��� update
				pstmt.setInt(3, 5000);
				pstmt.setString(4, "����");
				pstmt.setInt(5, 3);
				
//				if(f.getStock2Name()!=null) {
//					pstmt.setString(6, f.getStock2Name());
//					pstmt.setInt(7, f.getStock2Num());
//				} else {
					pstmt.setString(6, null);
					pstmt.setString(7, null);
//				}
//				if(f.getStock3Name()!=null) {
//					pstmt.setString(8, f.getStock3Name());
//					pstmt.setInt(9, f.getStock3Num());
//				} else {
					pstmt.setString(8, null);
					pstmt.setString(9, null);
//				}
				pstmt.setString(10, (num + "����"));//��ġ�ϴ� �̸� ���� ��� insert
				pstmt.setString(11, "����");
				pstmt.setString(12, "�ÿ��d");
				pstmt.setInt(13, 3000);
				pstmt.setString(14, "����");
				pstmt.setInt(15, 5);
//				if(f.getStock2Name()!=null) {
//					pstmt.setString(16, f.getStock2Name());
//					pstmt.setInt(17, f.getStock2Num());
//				} else {
					pstmt.setString(16, null);
					pstmt.setString(17, null);
//				}
//				if(f.getStock3Name()!=null) {
//					pstmt.setString(18, f.getStock3Name());
//					pstmt.setInt(19, f.getStock3Num());
//				} else {
					pstmt.setString(18, null);
					pstmt.setString(19, null);
//				}
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
					try {
						if(rs!=null)
							rs.close();
						if(pstmt!=null)
							pstmt.close();
						if(conn!=null)
							conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
		
		
		
	public static void main(String[] args) {
		temptest.getInstance().mergeMenu();
	}
}
