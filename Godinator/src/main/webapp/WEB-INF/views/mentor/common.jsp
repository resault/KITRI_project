<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="pg" value="${parameter.pg}"/>
<c:set var="state" value="${parameter.state}"/>
<c:set var="schoolCate1" value="${parameter.schoolCate1}"/>
<c:set var="hcate2" value="${parameter.hcate2}"/>
<c:set var="ucate2" value="${parameter.ucate2}"/>
<c:set var="schoolCate3" value="${parameter.schoolCate3}"/>
<c:set var="srch" value="${parameter.srch}"/>
<c:set var="msgCate" value="${parameter.msgCate}"/>
<c:set var="srcCate" value="${parameter.srcCate}"/>
<form id="list">
	<input type="hidden" name="pg" id="pg" value="${pg}">
	<input type="hidden" name="state" id="state" value="${state}">
	<input type="hidden" name="schoolCate1" id="schoolCate1" value="${schoolCate1}">
	<input type="hidden" name="hcate2" id="hcate2" value="${hcate2}">
	<input type="hidden" name="ucate2" id="ucate2" value="${ucate2}">
	<input type="hidden" name="schoolCate3" id="schoolCate3" value="${schoolCate3}">
	<input type="hidden" name="srch" id="srch" value="${srch}">
	<input type="hidden" name="msgCate" id="msgCate" value="${msgCate}">
	<input type="hidden" name="srcCate" id="srcCate" value="${srcCate}">
</form>