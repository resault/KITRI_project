package com.kitri.godinator.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MemberPreferDto;
import com.kitri.godinator.model.MentorDto;
import com.kitri.godinator.user.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String idCheck(String id) {
		int cnt = sqlSession.getMapper(UserDao.class).idCheck(id);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		return json.toString();
		
	}

	@Override
	public int register(MemberDto memberDto) {
		return sqlSession.getMapper(UserDao.class).register(memberDto);
	}

	@Override
	public int mentorRegister(Map<String, String> map) {
		System.out.println("mentorregister service");
		//int cnt = 0;
		String id = map.get("registerId");
		String highName = map.get("highSchool");
		String uniName = map.get("university");
		String hcheck = map.get("hcheck");
		String ucheck = map.get("ucheck");
		String hcate = map.get("hSchoolCate");
		String ucate = map.get("uSchoolCate");
		
		System.out.println("service ucheck" + ucheck);
		System.out.println("service hcheck" + hcheck);
		System.out.println("highName : " + highName);
		System.out.println("uniName : " + uniName);

			
		if(highName != "") {//member에 학교코드, 카테고리추가 (update) --고등학교
			 sqlSession.getMapper(UserDao.class).updateMemberh(map);//id, highName
			//cnt++; 
		}
		
		if(uniName != ""){
			 sqlSession.getMapper(UserDao.class).updateMemberu(map);//id, uniName
			//cnt++; //1	
		}
		
			
		if(!hcheck.isEmpty() && !ucheck.isEmpty()){
			sqlSession.getMapper(UserDao.class).insertMentorh(id);	//R, h
			return sqlSession.getMapper(UserDao.class).insertMentoru(id);  //R, u
			
		}else if(!hcheck.isEmpty()){
			return sqlSession.getMapper(UserDao.class).insertMentorh(id);  //R, h
			
		}else if(!ucheck.isEmpty()) {
			return sqlSession.getMapper(UserDao.class).insertMentoru(id);  //R, u	
			
		}
			 /* else if(hcheck =="" && ucheck ==""){ return
			 * sqlSession.getMapper(UserDao.class).insertMentor(id); //멘토테이블에 추가되면 안됨 }
			 */
		return 1;
		
	}

	@Override
	public int registerPrefer(MemberPreferDto memberPreferDto) {
		
		return sqlSession.getMapper(UserDao.class).insertMemberPreference(memberPreferDto);
	}

	@Override
	public MemberDto loginMember(Map<String, String> map) {
		
		return sqlSession.getMapper(UserDao.class).selectMember(map);
	}

	@Override
	public int modifyMember(MemberDto memberDto) {
		System.out.println("!!!!서비스옴!!!!");
		return sqlSession.getMapper(UserDao.class).modifyMember(memberDto);
	}

	@Override
	public int withdrawMember(String id) {
		return sqlSession.getMapper(UserDao.class).withdrawMember(id);
	}

	@Override
	public String selectHname(String hCode) {//고등학교 이름가져옴
		return sqlSession.getMapper(UserDao.class).selectHname(hCode);
	}

	@Override
	public String selectUname(String uCode) {//대학교 이름가져옴
		return sqlSession.getMapper(UserDao.class).selectUname(uCode);
	}

	@Override
	public List<String> selectCate(String id) {//멘토인 학교 리스트 가져옴
		return sqlSession.getMapper(UserDao.class).selectCate(id);
	}

	@Override
	public int mentorModifyRegister(Map<String, String> map) {
		//mentor에 아이디가 있으면 update하고 없으면 insert 하고     &   service에서 판단하는 거 따로 만들어야 할듯 
		//mentor 테이블에 해당 아이디가 있는지 확인!!
		String id = map.get("registerId");
		
		System.out.println("service에서 userId" + id);
		int cnt3 = sqlSession.getMapper(UserDao.class).ckId(id);
		
		int cnt = sqlSession.getMapper(UserDao.class).memberReset(id); //member 테이블에 있던 내용 다 지우기
		System.out.println("service memberreset cnt : "+ cnt );
		
		int cnt2=0;
		if(cnt==1) {
			System.out.println("cnt3 " + cnt3);
			if(cnt3>0) {//0이면 기존에 mentor가 아닌 사람, 1이상이면 기존에 멘토였던 사람 
				cnt2 = sqlSession.getMapper(UserDao.class).mentorReset(id); //기존에 멘토 내용 다 지우기 
				System.out.println("service mentorreset cnt2 : "+ cnt2 );
				mentorRegister(map);
			}else {//기존에 멘토가 아니었던 경우
				mentorRegister(map);
			}
		}

		return cnt+cnt2;
	}

	@Override
	public MemberDto findModify(String userId) {
		return sqlSession.getMapper(UserDao.class).findModify(userId);
	}

	@Override
	public String findHcate(String highSchool) {
		return sqlSession.getMapper(UserDao.class).findHcate(highSchool);
	}


}










