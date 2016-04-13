<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Ô, Bigode!</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
@font-face {
	font-family: 'Raleway-Light';
	src: url('./fonts/Raleway-Light.woff') format('woff'),
		/* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
       url('./fonts/Raleway-Light.ttf') format('truetype');
	/* Chrome 4+, Firefox 3.5, Opera 10+, Safari 3—5 */
}

@font-face {
	font-family: 'Raleway-SemiBold';
	src: url('./fonts/Raleway-SemiBold.woff') format('woff'),
		/* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
       url('./fonts/Raleway-SemiBold.ttf') format('truetype');
	/* Chrome 4+, Firefox 3.5, Opera 10+, Safari 3—5 */
}

@font-face {
	font-family: 'Raleway-Medium';
	src: url('./fonts/Raleway-Medium.woff') format('woff'),
		/* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
       url('./fonts/Raleway-Medium.ttf') format('truetype');
	/* Chrome 4+, Firefox 3.5, Opera 10+, Safari 3—5 */
}

body {
	padding-top: 15px;
	padding-bottom: 20px;
	text-align: left;
	font-family: 'Raleway-Medium';
}

p {
	padding-left: 2%;
	padding-bottom: 1%;
}

.menu {
	color: purple;
	padding-top: 5%;
	font-size: 150%;
}

.aviso {
	color: red;
}

.footerText {
	padding-top: 3%;
	color: white;
	font-family: 'Raleway-SemiBold';
}

#footerBar {
	height: 15%;
	background: purple;
	position: fixed;
	bottom: 0;
	width: 100%;
	z-index: -1
}

#sides {
	margin: 2%;
	border: 2%;
	padding: 5%;
	max-height: 800px;
	max-width: 600px;
}

#left {
	text-align: left;
	float: left;
	width: 30%;
	padding-right: 4%;
	overflow: hidden;
}

#right {
	text-align: left;
	float: left;
	width: 70%;
	overflow: hidden;
}
</style>
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">

<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<!-- <title>Bigode</title>  -->

</head>
<body>
	<div class="header clearfix" align="center">
		<a href="http://localhost:8080/bigode/index.jsp"> <img
			alt="LogoHorizontal" class="img-responsive" height=40% width=40%
			src="./img/Marca/bigode-marca-horizontal.png">
		</a>
	</div>
	<div id="menu-title">
		<p class="menu">Peca tudo o que quiser! ;)</p>
		<!-- append templateName aqui  -->	
		<p class="aviso">O que você pedir por aqui será incluido na conta
			da sua mesa e será pago tudo junto quando sua conta vier.</p>
	</div>

	<div id="sides">
		<div id="left">
			<img alt="default-placeholder" src="./img/default-placeholder.png"
				width="100%" height="100%">
		</div>
		<div id="right">
			
		</div>
	</div>


	<div id="footerBar">
		<p class="footerText">Preço total:</p>
	</div>

	<footer class="footer">
	<p>© Company 2014</p>
	</footer>

	</div>
	<!-- /container -->

	<script>

	function templateName(String mesa, String bar){
		return '<p>Você está na Mesa ' + mesa +' do Bar ' + bar +'</p>';
	}
	
	function templateProduct(String nomeProduto, String preco){
		 var templateProduto = '<dl>\n\
									<dt>' + nomeProduto + '</dt>\n\
									<dd>' + preco + '</dd>\n\
								</dl>';


		return templateProduto;
	}
	</script>


</body>
</html>