<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8 />
	<title>体重遍歴</title>

	<style type = "text/css">
		table, th, td { 
			border : 2px #000000 solid;
			border-collapse : collapse;
		}
		td {
			text-align : right;
		}
	</style>


	<script type="text/javascript" src="/js/jquery-2.1.0.min.js"></script>

	<!-- Google Charts & chartkick  -->
	<!-- http://quartet-communications.com/info/technology/14662 -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="/js/chartkick.js"></script>
	<!-- json to table -->
	<link href="/js/jquery.dynatable.css" rel="stylesheet" />
	<script type="text/javascript" src="/js/jquery.dynatable.js"></script>
	<!-- Datepicker -->
	<link href="/js/css/humanity/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"/>
	<script src="/js/jquery-ui-1.10.4.custom.min.js"></script>

	<!-- 独自実装JavaScript -->
	<script type="text/javascript">
	$(function(){
		function createTableData(tableTBodyObject, tableData) {
			tableTBodyObject.empty();
			var tbody_html = "";
			for(var i = 0; i < tableData.length; i = i+1) {
				tbody_html += "<tr>";
				tbody_html += "<td>" + tableData[i].date + "</td>";
				tbody_html += "<td>" + tableData[i].weight + "</td>";
				tbody_html += "<td>" + tableData[i].percentOfBody + "</td>";
				tbody_html += "</tr>";
			}
			tableTBodyObject.html(tbody_html);
		}
		
		
		var json_data = [
			{"date": "2014/04/01", "weight": 70, "percentOfBody": 24.5},
			{"date": "2014/04/02", "weight": 70, "percentOfBody": 24.5},
			{"date": "2014/04/03", "weight": 70, "percentOfBody": 24.5},
			{"date": "2014/04/04", "weight": 70, "percentOfBody": 24.5},
		];
		
		createTableData($('#weight_table tbody'), json_data);
		
		var json_graph_data = [
			{"name":"体重", "data": {
				"2014/04/01": 70,
				"2014/04/02": 70,
				"2014/04/03": 70,
				"2014/04/05": 70,}
			},
			{"name":"体脂肪率", "data": {
				"2014/04/01": 24.5,
				"2014/04/02": 24.5,
				"2014/04/03": 24.5,
				"2014/04/05": 24.5,}
			},
		];
		new Chartkick.LineChart('chart-2', json_graph_data);
		
		$("#datepicker").datepicker();

		
		
	});
	
	</script>
	
</head>
<body>

<div id = "header">
	<h1>体重遍歴</h1>
</div>

<div id = "contents">
	<div id="chart-2"></div>
	<table id = "weight_table">
		<thead>
			<tr>
			<th>日付</th>
			<th>体重</th>
			<th>体脂肪率</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id = "footer">
</div>



<input type="text" id="datepicker" />
</body>
</html>
