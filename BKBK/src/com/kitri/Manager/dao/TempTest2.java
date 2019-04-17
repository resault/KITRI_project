package com.kitri.Manager.dao;

import java.sql.*;

import com.kitri.Manager.data.FoodDto;

public class TempTest2 {

	public static void main(String[] args) {
//		FoodDto fd = new FoodDto();
//		fd.setFoodCtg(null);
////		fd.setFoodPrice((Integer)null);
//		if(fd.getFoodCtg()==null)
//			System.out.println("여기");
//			
////		System.out.println();
////		System.out.println(fd.getFoodPrice());
		
		//메뉴 개수 확인
		Connection conn;
		ResultSet rs;
		FoodDto fDto;
		Statement stmt;
		PreparedStatement pstmt;
		String sql;
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "project1";
		String pw = "project1";
		
		conn = null;
		pstmt = null;
		rs = null;
		sql = "select count(food_num) from food";
		int i = 0;
		try {
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			i = rs.getInt(1);
			
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
		System.out.println(i+1);
		
	}
}
