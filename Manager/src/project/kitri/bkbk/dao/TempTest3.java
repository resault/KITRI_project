package project.kitri.bkbk.dao;

import java.text.*;

import project.kitri.bkbk.data.MemberDto;

public class TempTest3 {

	public static void main(String[] args) {
		MemberDto m = new MemberDto();
		DateFormat f = new SimpleDateFormat("yyyy-mm-dd");
		try {
			m.setBirth(f.parse("1999-05-06"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Format s = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println(s.format(m.getBirth()));
		System.out.println(m.getBirth());
	}
}
