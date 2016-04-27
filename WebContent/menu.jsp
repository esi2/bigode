<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="DAO.BigodeDAO"%>
<%@page import="DAO.BigodeDAOImpl"%>
<%@page import="java.util.ArrayList"%>
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
	background-color: #aa86d0;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.sides {
	margin: 2%;
	border: 2%;
	padding: 5%;
	border: solid 1px #ebebeb;
	height: auto;
	overflow: hidden;
	position: relative;
	margin-bottom: 6%;
	display: inline-block;
}

.left {
	text-align: left;
	float: left;
	width: 30%;
	padding-right: 4%;
	overflow: hidden;
	margin-left: 10%;
	height: 100px;
}

.right {
	text-align: right;
	float: right;
	width: 50%;
	overflow: hidden;
	margin-right: 10%;
}

.down {
	width: 30%;
	height: 35px;
	background-color: #dd5855;
}

.up {
	width: 30%;
	height: 35px;
	background-color: #60bb7d;
}

.display {
	width: 40%;
	height: 35px;
	border: solid 1px #ebebeb;
	text-align: center;
}

.product {
	width: 100%;
	height: 100px;
	margin: 1%;
}

.contador {
	width: 50%;
    margin-left: 50%;
    display: inline-flex;
}
</style>
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">

<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<!-- <title>Bigode</title>  -->

</head>
<body>
	<script type="text/javascript">
		function modify_qty(val, elem) {

			var input = elem.parentElement.children[1];
			var new_qty = parseInt(input.value, 10) + val;

			if (new_qty < 0) {
				new_qty = 0;
			}

			input.value = new_qty;
			return new_qty;
		}
	</script>

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
	<%
		//	    BigodeDAO bgd = new BigodeDAOImpl();
		//		ArrayList<String> products = new ArrayList<String>();
		//		products = bgd.listaProduto(Integer.parseInt(request.getParameter("codMesa")));
	%>
	<%
		//	for(int i=0; i<products.size(); i+=3){ 
		//	String pic = products.get(i+2);
	%>
	<div class="sides" id="sides">
		<div class="product">
			<div class="left">
				<!--  <img alt="default-placeholder" src="data:image/jpeg;base64,< %=//pic%>"
				width="100%" height="100%">
				-->
				<img alt="default-placeholder" src="img/default-placeholder.png"
					width="100%" height="100%">
			</div>
			<div class="right">
				<dl>
					<dt class="nome">
						Coca 2L
						<%
							//out.println(products.get(i));
						%>
					</dt>
					<dd class="preco">
						R$10,00
						<%
							//out.println(products.get(i+1));
						%>
					</dd>
					<div class="contador">
						<button class="down" onclick="modify_qty(-1, this)">-</button>

						<input class="display" disabled id="qty" value="0" />

						<button class="up" onclick="modify_qty(1, this)">+</button>
					</div>
				</dl>
				<%
					//}
				%>
			</div>
		</div>
	</div>


	<div id="footerBar">
		<p class="footerText">Preço total:</p>
	</div>

	<!-- /container -->

	<script>
		function templateName(mesa, bar) {
			return '<p>Você está na Mesa ' + mesa + ' do Bar ' + bar + '</p>';
		}

		function templateProduct(nomeProduto, preco) {
			var templateProduto = '<dl>\n\
									<dt>' + nomeProduto
					+ '</dt>\n\
									<dd>' + preco
					+ '</dd>\n\
								</dl>';

			return templateProduto;
		}
	</script>


</body>
</html>