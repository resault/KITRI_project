<%@page import="com.kitri.godinator.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.sendRedirect(request.getContextPath() + "/searchschool/viewsearch");
MemberDto memberDto = new MemberDto();
memberDto.setUserId("testid");
session.setAttribute("userInfo", memberDto);
%>