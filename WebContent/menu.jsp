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
<link rel="stylesheet" href="css/bigode-dono.css">

<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

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
			
			var displays = document.getElementsByClassName('display');
			var prices = document.getElementsByClassName('preco');
			var soma = 0;
			for (var i = 0; i < displays.length; i++) {
				soma += (parseInt(displays[i].value, 10) * parseInt(
						prices[i].innerText, 10));
			}
			
			document.getElementsByClassName('footerText')[0].innerText = "Preço Total: R$ " + soma + ",00";
			
			return new_qty;
		}
	</script>

	<div class="header clearfix" align="center">
		<a href="index.jsp"> <img alt="LogoHorizontal"
			class="img-responsive" height=40% width=40%
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
		BigodeDAO bgd = new BigodeDAOImpl();
		ArrayList<String> products = new ArrayList<String>();
		products = bgd.listaProduto(Integer.parseInt(request.getParameter("codMesa")));
	%>

	<div id="sides">
		<%
			for (int i = 0; i < products.size(); i += 3) {
				String pic = products.get(i + 2);
		%>
		<div class="sides" id="sides">

			<div class="product">
				<div class="left">
					<img src="data:image/jpeg;base64,<%=pic%>" width="100px"
						height="100px">

					<!-- <img alt="default-placeholder" src="img/default-placeholder.png" width="100%" height="100%"> -->
				</div>
				<div class="right">
					<dl>
						<dt class="nome">
							<%
								out.println(products.get(i));
							%>
						</dt>
						<dd class="preco">
							<%
								out.println(products.get(i + 1));
							%>
						</dd>
						<div class="contador">
							<button class="down" onclick="modify_qty(-1, this)">-</button>

							<input class="display" disabled id="qty" value="0" />

							<button class="up" onclick="modify_qty(1, this)">+</button>
						</div>
					</dl>

				</div>

			</div>

		</div>
	</div>
	<%
						}
					%>

	<div class="container">
		<div class="row">
			<div class="col-xs-4">
				<img alt="default-placeholder" src="img/default-placeholder.png"
					width="100%" height="100%">
			</div>
			<div class="col-xs-8">
				<div class="row">
					<div class="col-xs-8">Nome</div>
				</div>
				<div class="row">
					<div class="col-xs-8">Preco</div>
				</div>
				<div class="row no-gutters">
					<div class="col-xs-3">
						<button class="down" onclick="modify_qty(-1, this)">-</button>

					</div>
					<div class="col-xs-2">
						<input class="display" disabled id="qty" value="0" />

					</div>
					<div class="col-xs-3">
						<button class="up" onclick="modify_qty(1, this)">+</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /container -->


	<div id="footerBar">
		<p class="footerText">Preço total: R$ 0,00</p>
	</div>


	<script>
			function templateName(mesa, bar) {
				return '<p>Você está na Mesa ' + mesa + ' do Bar ' + bar
						+ '</p>';
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
