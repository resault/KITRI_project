package com.kitri.godinator.schoolinfo.controller;

import java.util.regex.Pattern;

public class Test {
	
	public static void main(String[] args) {
//		BufferedReader in = null;
//		 try {
//		URL obj = new URL("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=a36f789e2d6a511e97d844cd76d63c81&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&sch2=100369&thisPage=1&perPage=1"); // 호출할 url
//
//		HttpURLConnection con = (HttpURLConnection)obj.openConnection();
//
//		con.setRequestMethod("GET");
//		in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
//
//		String line = "";
//		String str = "";
//		while((line = in.readLine()) != null) { // response를 차례대로 출력
//			str += line;
//			System.out.println(str);
//		}
//		int schoolName = str.indexOf("\"schoolName\":\"")+14;
//		int schoolType = str.indexOf("\"schoolType\":\"")+14;
//		int address = str.indexOf("\"adres\":\"")+9;
//		int testSchoolName = str.indexOf("\"", schoolName);
//		int testSchoolType = str.indexOf("\"", schoolType);
//		String schoolNameStr = str.substring(schoolName, testSchoolName);
//		String schoolTypeStr = str.substring(schoolType, testSchoolType);
//		String schoolAddressStr = str.substring(address, address+2);
//		System.out.println("schoolName : "+schoolName + " schoolType :"+schoolType + " testSchoolName : " + testSchoolName + " testSchoolType : "+ testSchoolType + " schoolAddressStr : " + schoolAddressStr);
//		System.out.println("schoolNameStr : " + schoolNameStr +" schoolTypeStr : " + schoolTypeStr);
//		} catch(Exception e) {
//		e.printStackTrace();
//		} finally {
//		if(in != null) try { in.close(); } catch(Exception e) { e.printStackTrace(); }
//
//		}
		String regex = "^\\/\\/([^:\\/\\s]+)(:([^\\/]*))?((\\/[^\\s/\\/]+)*)?\\/?([^#\\s\\?]*)(\\?([^#\\s]*))?(#(\\w*))?$";
		Pattern p = Pattern.compile(regex);
		String urlTrue = "//lh4.googleusercontent.com/proxy/GvZy40YjUMy1F3P5ltS7cMpMYSihA8QyseHVDFHeYlk9JQhOLJNo-dImvIKviVmiW_pbGjhgVl8WyXFPtTWVVqwMTnzdOqstK8AQh6IijORGOhIqJrYZZNQ4Oz-A7YDLXf_UKpJTjkZjNgQzcByYJ03BEOJ_vg=w139-h79-k-no";
		String urlFalse1 = "/maps/vt/data=yNP-VRpoZm1exJIEkI3LOlQ0aBAVVLZtLpAP0sjqgy-TP67K8iAtb3Ne1pfLw-CBr4_eDHLd0w4LDZ7wt18Uv_nuBKPZgRs_o4JACkuPrkd97HaWGI48Byc";
		String urlFalse2 = "data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==";
		System.out.println(p.matcher(urlTrue).matches());
		System.out.println(p.matcher(urlFalse1).matches());
		System.out.println(p.matcher(urlFalse2).matches());
	}
}