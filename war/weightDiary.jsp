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
		// データからtableを作成する
		// tableTBodyObject データを表示する表のボディのオブジェクト
		// tableData 表示するデータ
		function createTableData(tableData, tableTBodyObject) {
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
		
		// サンプルデータ
		var json_data = [
			{"date": "2014/04/01", "weight": 70, "percentOfBody": 24.5},
			{"date": "2014/04/02", "weight": 71, "percentOfBody": 25.5},
			{"date": "2014/04/03", "weight": 72, "percentOfBody": 26.5},
			{"date": "2014/04/04", "weight": 73, "percentOfBody": 27.5},
		];
		
		// 取得したデータの表を作成
		createTableData(json_data, $('#weight_table tbody'));

		// 表のデータをグラフ表示用に変換
		// 体重
		var array_daily_weight = [];
		for(var i = 0; i < json_data.length; ++i) {
			var daily_weight = [];
			daily_weight.push(json_data[i].date);
			daily_weight.push(json_data[i].weight);
			
			array_daily_weight.push(daily_weight);
		}
		var obj_daily_weight = {};
		obj_daily_weight["name"] = "体重";
		obj_daily_weight["data"] = array_daily_weight;

		// 体脂肪率
		var array_daily_percent = [];
		for(var j = 0; j < json_data.length; ++j) {
			var daily_percent = [];
			daily_percent.push(json_data[j].date);
			daily_percent.push(json_data[j].percentOfBody);
			
			array_daily_percent.push(daily_percent);
		}
		var obj_daily_percent = {};
		obj_daily_percent["name"] = "体脂肪率";
		obj_daily_percent["data"] = array_daily_percent;
		
		// グラフ表示用Object作成
		var json_graph_data = [];
		json_graph_data.push(obj_daily_weight);
		json_graph_data.push(obj_daily_percent);
		
		// グラフを描画
		new Chartkick.LineChart('weight_chart', json_graph_data);
		
		$("#datepicker").datepicker();
		
		
	});
	
	</script>
	
</head>
<body>

<div id = "header">
	<h1>体重遍歴</h1>
</div>

<div id = "contents">
	<div id="weight_chart"></div>
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
