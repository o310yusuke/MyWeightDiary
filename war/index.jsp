<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8 />
	<title>私の体重遍歴</title>
	
	<link href="/js/css/humanity/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"/>
	<script type="text/javascript" src="/js/jquery-2.1.0.min.js"></script>
	<script src="/js/jquery-ui-1.10.4.custom.min.js"></script>
	
</head>
<body>
<div id = "header">
	<h1>私の体重遍歴</h1>
</div>

<div id = "menu">
	<ul>
	<li><button>ログイン</button></li>
	<li><a href="/weightDiary"><button>体重遍歴</button></a></li>
	<li><button>ログアウト</button></li>
	</ul>
</div>


<div id = "contents">
</div>

<div id = "footer">
</div>

</body>
</html>
