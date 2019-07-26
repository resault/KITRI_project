package com.kitri.godinator.schoolinfo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.dao.SchoolInfoCommonDao;

@Service
public class SchoolInfoCommonServiceImpl implements SchoolInfoCommonService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HSchoolDto> selectHSchoolName(Map<String, String> parameter) {
		return sqlSession.getMapper(SchoolInfoCommonDao.class).selectHSchoolName(parameter);
	}
	
	@Override
	public List<USchoolDto> selectUSchoolName(Map<String, String> parameter) {
		return sqlSession.getMapper(SchoolInfoCommonDao.class).selectUSchoolName(parameter);
	}

	@Override
	public void mergeSearchLog(Map<String, String> parameter) {
		sqlSession.getMapper(SchoolInfoCommonDao.class).mergeSearchLog(parameter);
	}

	@Override
	public void hSchoolDataInsert() {
		BufferedReader in = null;
		int totalCnt = 0;
		 try {
		for(int i = 1; i<2387; i++) {
									  
			URL obj = new URL("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=a36f789e2d6a511e97d844cd76d63c81&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&thisPage="+i+"&perPage=1"); // 호출할 url
	
			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
	
			con.setRequestMethod("GET");
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	
			String line = "";
			String str = "";
			while((line = in.readLine()) != null) { // response를 차례대로 출력
				str += line;
				System.out.println(str);
			}
			int schoolName = str.indexOf("\"schoolName\":\"")+14;
			int schoolType = str.indexOf("\"schoolType\":\"")+14;
			int address = str.indexOf("\"adres\":\"")+9;
			int testSchoolName = str.indexOf("\"", schoolName);
			int testSchoolType = str.indexOf("\"", schoolType);
			String schoolNameStr = str.substring(schoolName, testSchoolName);
			String schoolTypeStr = str.substring(schoolType, testSchoolType);
			String schoolAddressStr = str.substring(address, address+2);
			System.out.println("schoolName : "+schoolName + " schoolType :"+schoolType + " testSchoolName : " + testSchoolName + " testSchoolType : "+ testSchoolType + " schoolAddressStr : " + schoolAddressStr);
			System.out.println("schoolNameStr : " + schoolNameStr +" schoolTypeStr : " + schoolTypeStr);
			Map<String, String> parameter = new HashMap<String, String>();
			parameter.put("schoolCate2", schoolTypeStr);
			parameter.put("schoolName", schoolNameStr);
			parameter.put("address", schoolAddressStr);
			int cnt = sqlSession.getMapper(SchoolInfoCommonDao.class).hSchoolDataInsert(parameter);
			totalCnt += cnt;
			Thread.sleep(10);
		}
		System.out.println("업데이트된 행 갯수 : " + totalCnt);
		} catch(Exception e) {
		e.printStackTrace();
		} finally {
		if(in != null) try { in.close(); } catch(Exception e) { e.printStackTrace(); }

		}
	}

}
