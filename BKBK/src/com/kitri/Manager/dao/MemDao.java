package com.kitri.Manager.dao;

import java.sql.*;
import java.text.*;
import java.util.Vector;

import com.kitri.Manager.data.*;

import java.util.Date;

public class MemDao {
	private Connection conn;
	private ResultSet rs;
	private FoodDto fDto;
	private StockDto sDto;
	private Statement stmt;
	private PreparedStatement pstmt;
	private String sql;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "project1";
	String pw = "project1";
	
	// �̱��� 
	private static MemDao instance = new MemDao();//�ڽ��� ��ü��  ����
	private MemDao() {}
	public static MemDao getInstance() {//�ܺο��� Ŭ������.getInstance()�� ȣ���ϸ� �� Ŭ������ ��ü�� ��ȯ��
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return instance;
	}
	
	
	
	public Vector serchM(String colName, String str) {//��üsel, serchMem
		Vector list = new Vector();
		conn = null;
		pstmt = null;
		try {
			conn = DriverManager.getConnection(url, user, pw);
			if(colName != null && str != null) {
				sql = "select member_id, name, phone_num1 || ' - ' || phone_num2 || ' - ' || phone_num3, address, to_char(birth, 'yyyy-mm-dd'), cou_sale" + 
						" from member" + 
						" where " + colName +" like ? and state = '1'" +
						" order by name";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ("%"+str+"%"));
			}
			else {
				sql = "select member_id, name, phone_num1 || ' - ' || phone_num2 || ' - ' || phone_num3, address, to_char(birth, 'yyyy-mm-dd'), cou_sale" + 
						" from member" +
						" where state='1'" +
						" order by name";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()) {
				Vector a = new Vector();
				a.add(++i);
				String id = rs.getString("member_id");
				a.add(id);
				a.add(rs.getString("name"));
				a.add(rs.getString(3));
				a.add(rs.getString("address"));
				a.add(rs.getString(5));
				a.add(rs.getInt("cou_sale"));

				String s1 = useHstr(id);
				if(s1 != null) {
					a.add(s1);
				} else {
					a.add(null);
				}
				
				String s2 = rentHstr(id);
				if(s2 != null) {
					a.add("������");
				} else {
					a.add(null);
				}
				list.add(a);
			}
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
		return list;
	}
	
	private String useHstr(String id) { //������ �̿��� ��������
		conn = null;
		pstmt = null;
		String a = null;
		try {
			sql = "select to_char(max(pay_date), 'yyyy-mm-dd') from use_hstr" +
					" where member_id = ?";
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rrs = pstmt.executeQuery();
			rrs.next();
			if(rrs.getRow() != 0)
				a = rrs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

	private String rentHstr(String id) {//������Ȳ ��������
		conn = null;
		pstmt = null;
		String s = null;
		try {
			sql = "select distinct member_id, rent_state from rent_hstr where member_id = ? and rent_state != 0";
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rrs = pstmt.executeQuery();
			rrs.next();
			if(rrs.getRow() != 0)
				s = rrs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public MemberDto findM(String id) {
		conn = null;
		pstmt = null;
		MemberDto m = new MemberDto();
		try {
			sql = "select member_id, name, phone_num1, phone_num2, phone_num3, address, to_char(birth, 'yyyy-mm-dd')" + 
					" from member" + 
					" where member_id = ?";
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			m.setMemberId(rs.getString("member_id"));
			m.setName(rs.getString("name"));
			m.setPhoneNum1(rs.getString("phone_num1"));
			m.setPhoneNum2(rs.getString("phone_num2"));
			m.setPhoneNum3(rs.getString("phone_num3"));
			m.setAddress(rs.getString("address"));
			DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
			m.setBirth(df.parse(rs.getString(7)));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
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
		return m;
	}
	
	public void delM(String id) {
		conn = null;
		pstmt = null;
		sql = "update member set state = '0' where member_id = ?";
		try {
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public void amM(MemberDto memDto) {
		conn = null;
		pstmt = null;
		MemberDto m = memDto;
		sql = "merge into member" + 
				" using dual" + 
				" on (member_id = ?)" + 
				" when matched then" + 
				" update set address = ?, phone_num1 = ?, phone_num2 = ?, phone_num3 = ?, name = ?, state = '1'" + 
				" when not matched then" + 
				" insert values (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, 0, 0, 0, '1')";
		try {
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getAddress());
//			pstmt.setString(3, m.getMemberId());
			pstmt.setString(3, m.getPhoneNum1());
			pstmt.setString(4, m.getPhoneNum2());
			pstmt.setString(5, m.getPhoneNum3());
			pstmt.setString(6, m.getName());
			pstmt.setString(7, m.getName());//��ġ�ϴ� �̸� �ִ� ��� update
			pstmt.setString(8, m.getPhoneNum1());
			pstmt.setString(9, m.getPhoneNum2());
			pstmt.setString(10, m.getPhoneNum3());
			pstmt.setString(11, m.getAddress());
			Format f = new SimpleDateFormat("yyyy-MM-dd");
			pstmt.setDate(12, java.sql.Date.valueOf(f.format(m.getBirth())));// util.date�� m.getBirth()�� f������ String���� �ٲٰ�, sql.Date�� valueOf�� sql.Date�� ��ȯ
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
	
}
