<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://www.chartjs.org/dist/2.8.0/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#visitSt").click(function() {
		location.href = "${root}/admin/visitSt";
	});
	$("#memberSt").click(function() {
		location.href = "${root}/admin/memberSt";
	});

	$("#searchlogSt").click(function() {
		location.href = "${root}/admin/searchlogSt";
	});
	
});
</script>

<style>
.topButton {
	width: 300px; 
	margin-top: 30px;
	margin-left: 10px;
}
</style>

<div class="" id="visitSt" style="display: inline-block;"><img src="${root }/resources/images/admin/stat_visitor.png"  style="width: 300px; margin-top: 30px;"></div>
<div class="" id="memberSt" style="display: inline-block;"><img src="${root }/resources/images/admin/stat_member.png"  class="topButton"></div>

<div class="" id="searchlogSt" style="display: inline-block;"><img src="${root }/resources/images/admin/stat_searchlog.png"  class="topButton"></div>