<!-- 
	1. 방문자
	2. 가장 많이 가입한 학교학생들 TOP
	3. 회원들이 학교 선택할 떄 가장 중요하게 생각하는 요소
	4. 가장 조회수가 높은 검색어 순위

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/own/admin_header.jsp"%>
<%@ include file="/WEB-INF/views/template/own/admin_statistics.jsp"%>
<section style="padding-top: 15px;">
		<div id="canvas-holder" style="width:50%">
		<canvas id="chart-area"></canvas>
	</div>
	</section>
	<script>
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var chartColors = window.chartColors;
		var color = Chart.helpers.color;
		var config = {
			data: {
				datasets: [{
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
					],
					backgroundColor: [
						color(chartColors.red).alpha(0.5).rgbString(),
						color(chartColors.orange).alpha(0.5).rgbString(),
						color(chartColors.yellow).alpha(0.5).rgbString(),
						color(chartColors.green).alpha(0.5).rgbString(),
						color(chartColors.blue).alpha(0.5).rgbString(),
					],
					label: 'My dataset' // for legend
				}],
				labels: [
					'Red',
					'Orange',
					'Yellow',
					'Green',
					'Blue'
				]
			},
			options: {
				responsive: true,
				legend: {
					position: 'right',
				},
				title: {
					display: true,
					text: 'Chart.js Polar Area Chart'
				},
				scale: {
					ticks: {
						beginAtZero: true
					},
					reverse: false
				},
				animation: {
					animateRotate: false,
					animateScale: true
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area');
			window.myPolarArea = Chart.PolarArea(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(piece, i) {
				piece.data.forEach(function(value, j) {
					config.data.datasets[i].data[j] = randomScalingFactor();
				});
			});
			window.myPolarArea.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addData').addEventListener('click', function() {
			if (config.data.datasets.length > 0) {
				config.data.labels.push('data #' + config.data.labels.length);
				config.data.datasets.forEach(function(dataset) {
					var colorName = colorNames[config.data.labels.length % colorNames.length];
					dataset.backgroundColor.push(window.chartColors[colorName]);
					dataset.data.push(randomScalingFactor());
				});
				window.myPolarArea.update();
			}
		});
		document.getElementById('removeData').addEventListener('click', function() {
			config.data.labels.pop(); // remove the label first
			config.data.datasets.forEach(function(dataset) {
				dataset.backgroundColor.pop();
				dataset.data.pop();
			});
			window.myPolarArea.update();
		});
	</script>

<%@ include file="/WEB-INF/views/template/own/admin_sidebar.jsp"%>