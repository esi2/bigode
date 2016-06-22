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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bigode-dono.css">

<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="js/frontend/menuFunctions.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
		$(document).$(function() {
			  $('.col-xs-2.display-div').on('keydown', '.display', function(e)
					  {-1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()
				  });
			})
		</script>

<title>Ô, Bigode!</title>
</head>
<body>
	<div class="header clearfix" align="center">
		<a href="index.jsp"> <img alt="LogoHorizontal"
			class="img-responsive" height=40% width=40%
			src="./img/Marca/bigode-marca-horizontal.png"></a>
	</div>
	<%
            BigodeDAO bgd = new BigodeDAOImpl();
            String nome = bgd.getNomeBar(Integer.parseInt(request.getParameter("bar")));
        %>
	<div id="menu-title">
		<p class="titulo">Peça tudo o que quiser! ;)</p>
		<p>
			Você está na Mesa
			<%=request.getParameter("codMesa")%>
			do Bar
			<%=nome%></p>
		<p class="aviso">O que você pedir por aqui será incluido na conta
			da sua mesa e será pago tudo junto quando sua conta vier.</p>
	</div>

	<%
            ArrayList<String> products = new ArrayList<String>();
            products = bgd.listaProduto(Integer.parseInt(request.getParameter("bar")));
        %>

	<%
            for (int i = 0; i < products.size(); i += 4) {
                String pic = products.get(i + 2);
        %>

	<div class="container produto-borda">

		<div class="row">
			<div class="col-xs-4">
				<img class="imagem-produto" src="<%=pic%>">
			</div>
			<div class="col-xs-8">
				<div class="row">
					<div class="col-xs-8">
						<p class="nome-produto">
							<%
                                    out.println(products.get(i));
                                    
                                %>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<p class="preco-produto">
							<%
                                    out.println(products.get(i + 1));
                                %>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<p class="id_produto">
							<input type="hidden" class='id_prod'
								value="<%=products.get(i + 3)%>">
						</p>
					</div>
				</div>
				<div class="row no-gutters contador">
					<div class="col-xs-3">
						<button class="button-2d down" onclick="modifyQty(-1, this)">-</button>
					</div>
					<div class="col-xs-2 display-div" style="width: 30%;">
						<input class="display" id="qty" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
							onblur="modifyQtyBlur(this)" value="0" />
					</div>
					<div class="col-xs-3">
						<button class="button-2d up" onclick="modifyQty(1, this)">+</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
            }
        %>
	<!-- /container -->

	<div id="footerBar">
		<div class="button-place right">
			<button id="submit-btn" class="button-pedido button-2d"
				onclick="order();
                        jsonForm.submit()">
				<p class="font-pedido">Fazer Pedido</p>
			</button>
		</div>
		<p class="footerText">Preço Total: R$ 0,00</p>
	</div>

	<form name='jsonForm' action='Pedido' method='Post'>
		<input type='hidden' id='jsonPedido' name='jsonPedido'
			class='jsonPedido'> <input type='hidden' id='flag'
			name='flag' value="<%=request.getParameter("flag")%>"> <input
			type='hidden' id='sessao' name='sessao'
			value="<%=request.getParameter("sessao")%>">

	</form>
</body>
</html>
