package com.kitri.godinator.schoolinfo.util;

public class SchoolInfoUtil {
	
	public static int getIntDefaultOne(String num) {
		int result = 1;
		boolean flag = true;
		if(num != null) {
			int length = num.length();
			for(int i=0; i < length; i++) {
				if(num.charAt(i) < 48 || num.charAt(i) > 57) {
					flag = false;
					break;
				}
			}
			if(flag)
				result = Integer.parseInt(num);
		}
		return result;
	}
	
	public static int getIntDefaultZero(String num) {
		int result = 0;
		boolean flag = true;
		if(num != null) {
			int length = num.length();
			for(int i=0; i < length; i++) {
				if(num.charAt(i) < 48 || num.charAt(i) > 57) {
					flag = false;
					break;
				}
			}
			if(flag)
				result = Integer.parseInt(num);
		}
		return result;
	}
	
	public static int getInt(String num) {
		return Integer.parseInt(num);
	}
}
