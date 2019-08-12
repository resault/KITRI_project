<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
 
 <style>
 #questionaire td:hover{
 	background-color: yellow;
 }
 </style>
 
 <script type="text/javascript">
	$(document).ready(function() {
		$('#questionaire td').click(function() {
			alert('click');
		});
	});
</script>
 
<div id="contents">
	<img src="${root }/resources/images/admin/geomsa(2).png" style="width: 5px; padding-left: 500px;">
	<table class="pure-table" id="questionaire">
		<thead>
			<tr>
				<th style="width: 436.6666px;">문제</th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
			 </tr>
		</thead>
                
		<tbody>
			<tr v-for="item in jobs">
            	<td id="question">{{item.question}}</td>
                <td id="a1">{{item.answer01}}</td>
                <td id="a2">{{item.answer02}}</td>
                <td id="a3">{{item.answer03}}</td>
                <td id="a4">{{item.answer04}}</td>
                <td id="a5">{{item.answer05}}</td>
                <td id="a6">{{item.answer06}}</td>
                <td id="a7">{{item.answer07}}</td>
			</tr>
		</tbody>
	</table>
</div>
<div style="float: right; margin-bottom: 60px;"><button>submit</button></div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#contents',
        data: {
            jobs:[]
        },
        methods: {
            
        },
        computed: {}
    });
    app.$nextTick(function () {
        axios.get('http://inspct.career.go.kr/openapi/test/questions?apikey=76bb04e98de628d1c3711ade67c2344f&q=21').then(function(res){
            app.jobs = res.data.RESULT;
           //console.log('이게 뭔데' + app.jobs);
        });
    });
</script>
</html>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>