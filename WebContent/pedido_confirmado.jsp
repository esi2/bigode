<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BigodeDAOImpl"%>
<%@page import="DAO.BigodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    $("#fechar-conta").click(function(){
	        $("#escolha").hide();
	        $("#pedido-cozinha").hide();
	        $("#pague-escolha").show();
	    });
	    $("#pagar-sozinho").click(function(){
	    	$("#pague-escolha").hide();
	        $("#pague-sozinho").show();
	        $("#botao-pagar").show();
	    });
	});
</script>

<title>Ô, Bigode!</title>

</head>
<body>
	<div class="header clearfix" align="center">
		<a href="index.jsp"> <img alt="LogoHorizontal"
			class="img-responsive" height=40% width=40%
			src="./img/Marca/bigode-marca-horizontal.png"></a>
	</div>

	<div class="container">

		<div id="pedido-cozinha" style="display: block">
			<div id="confirmado-title" class="col-xs-12">
				<p class="titulo">O pedido já foi para a cozinha!</p>
				<p class="font-texto">Daqui a pouco o garçom chegará com tudo o
					que você pediu, já foi meio caminho andado.</p>
			</div>

			<!-- Default Flow: Fazer novo pedido ou Pedir conta -->

			<div id="escolha" class="row">

				<div id="btn-container" class="col-xs-10 col-xs-offset-1">
					<button id="novo-pedido" class="btn btn-novo-pedido show"
						onclick="">
							<strong> Fazer um novo pedido </strong>
					</button>
				</div>


				<div class="col-xs-12">
					<br>
					<p align="center">
						<strong> Ou </strong>
					<p>
				</div>

				<div id="btn-container" class="col-xs-10 col-xs-offset-1">
					<button id="fechar-conta" class="btn btn-fechar-conta show">
						<strong> Pedir a conta </strong>
					</button>
				</div>

			</div>
		</div>

		<!-- Flow Pedir conta: Pagar sozinho ou dividir -->

		<div id="pague-escolha" style="display: none">
			<div id="confirmado-title" class="col-xs-12">
				<p class="titulo">Pague sua conta para o garçom!</p>
				<p class="font-texto">Esperamos que tenham gostado do bar do
					Chaim. :]</p>
			</div>

			<div id="escolha" class="row">

				

				<div id="btn-container" class="col-xs-10 col-xs-offset-1">
					<button id="pagar-sozinho" class="btn btn-fechar-conta show">
						<strong> Pagar sozinho </strong>
					</button>
				</div>

			</div>
		</div>

		<!-- Flow Pagar Sozinho: Escolha pagar 10% -->

		<div id="pague-sozinho" style="display: none">
			<div id="confirmado-title" class="col-xs-12">
				<p class="titulo">Pague sua conta para o garçom!</p>
				<p class="font-texto">Esperamos que tenham gostado do bar do
					Chaim. :]</p>
			</div>

			<div id="escolha" class="row">
				<form action="">
					<input type="checkbox" name="gorjeta" value="sim">
					<p>Quero pagar os 10% do atendimento</p>
				</form>
			</div>
		</div>

		<div class="row">
			<br>
			<!-- Separacao -->
		</div>

		<!-- Default: Exibir itens pedidos pela mesa -->
                <%
                BigodeDAO bdg = new BigodeDAOImpl();
                double total = 0.0;
                ArrayList<String> results = new ArrayList<String>();
                results = bdg.listaPedidos(Integer.parseInt(request.getParameter("sessao")));
                %>
		<div id="pedidos" class="col-xs-12">
			<strong> Lista de Pedidos </strong>
				
                                <%
                                int balde = 0;
                                int cont =0;
                                for(int x =0; x < results.size(); x +=4){
                                if(balde != Integer.parseInt(results.get(x+3))){
                                    balde = Integer.parseInt(results.get(x+3));
                                    if(cont >0) out.println("</div>");   
                                    cont++;
                                    out.println("<div id=\"pedido1\" class=\"row\"> Pedido" + cont);
                                }
                                                                     
                                %>
				<div class="col-xs-12 produto-borda">
					<div class="col-xs-6">
						<p class="nome-produto" align="left"><%=results.get(x+1)%>x <%=results.get(x)%>(s)</p>
					</div>
					<div class="col-xs-6">
						<p class="preco-produto" align="right">R$<%=results.get(x+2)%></p>
                                                <%total +=Double.parseDouble(results.get(x+2));%>
                                                
                                        </div>

				</div>
                               <%
                                
                                }%>
			
		</div>

	</div>

	<!-- Flow Pagar Sozinho: Fim -->

	<div id="fim" style="display: none">
		<div id="fim-title" class="col-xs-12">
			<p class="titulo">Obrigado! :) </p>
			<p class="font-texto">Esperamos que tenham gostado do bar do
				Chaim. :]
				
				Divulgue o Bigode nas redes sociais para vê-lo em mais bares desse brasilzão:
				</p>
		</div>

		<div id="redes-sociais" class="row">
			<div id="facebook" class="col-xs-12">
				<img class="img-responsive img-rounded" alt="" src="./img/RedesSociais/fb-share.png">
			</div>
		
			<div id="googlePlus" class="col-xs-4">
				<img class="img-responsive img-rounded" alt="" src="./img/RedesSociais/google+.png">
			</div>
			<div id="twitter" class="col-xs-4">
				<img class="img-responsive img-rounded" alt="" src="./img/RedesSociais/twitter.png">
			</div>	
			<div id="link" class="col-xs-4">
				<img class="img-responsive img-rounded" alt="" src="./img/RedesSociais/link-open-flat.png">
			</div>
			
		</div>
	</div>
      
	<div id="footerBar" style="display: block">
		<!-- Flow: Botao aparece apenas apos selecionar Pedir Conta -> Pagar Sozinho -->
		<div id="botao-pagar" class="button-place right" style="display: none">
			<button id="submit-btn" class="button-pedido button-2d" onclick="">
				<p class="font-pedido">Pagar conta</p>
			</button>
		</div>
		<p class="footerText">Total: R$ <%= total %></p>
	</div>

	<form name='jsonForm' action='Pedido' method='Post'>
		<input type='hidden' id='jsonPedido' name='jsonPedido'
			class='jsonPedido'> <input type='hidden' id='sessao'
			name='sessao' value="<%=request.getParameter("sessao")%>">

	</form>
                        
	<script>
		// Provisorio
                
		document.getElementById("novo-pedido").onclick = function () {
                var sessao = <%=request.getParameter("sessao")%>;
	        location.href = "menu.jsp?codMesa=<%=request.getParameter("codMesa")%>&bar=1&sessao="+sessao+"&flag=n";
	    };
	    
	    document.getElementById("botao-pagar").onclick = function () {
	        location.href = "volte_sempre.jsp";
	    };
	</script>
	

</body>
</html>