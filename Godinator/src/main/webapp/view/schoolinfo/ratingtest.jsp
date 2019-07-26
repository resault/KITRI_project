<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
});
</script>
</head>
<body>
<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
  <span class="starR">별6</span>
  <span class="starR">별7</span>
  <span class="starR">별8</span>
  <span class="starR">별9</span>
  <span class="starR">별10</span>
</div>
</body>
</html>