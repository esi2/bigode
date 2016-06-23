<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BigodeDAOImpl"%>
<%@page import="DAO.BigodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
            $(document).ready(function () {
                $("#fechar-conta").click(function () {
                    $("#escolha").hide();
                    $("#pedido-cozinha").hide();
                    $("#pague-escolha").show();
                });
                $("#pagar-sozinho").click(function () {
                    $("#pague-escolha").hide();
                    $("#pague-sozinho").show();
                    $("#botao-pagar").show();
                });
                $('#percent').click(function () {
                	var doubleString = document.getElementById('total').innerText.replace(',', '.');
					doubleString = doubleString.split(" ")[2];
                    final = 0;
					doubleString = parseFloat(doubleString);
                    if (this.checked) {
                        var dezPorCento = roundToTwo(doubleString / 10);
                        final = doubleString + dezPorCento;
                    } else {
                        var onzePorCento = roundToTwo(doubleString / 11);
                        final = doubleString - onzePorCento;
                    }
                    final = final.toString().split(".");
                    document.getElementsByClassName('footerText')[0].innerText = "Total: R$ " + final[0] + "," + (final[1] ? correctCents(final[1]) : "00");
                });
            });
        </script>

<script>
            function passaTotal(){
                var totalOriginal = document.getElementById('total').innerText;
                totalOriginal = totalOriginal.replace('Total: R$ ','');
                totalOriginal = totalOriginal.replace(',','.');
                document.getElementById('preco').value = totalOriginal;
                
            }
            
            </script>
            <script>
    window.onload = function() {
    	var doubleString = document.getElementById('total').innerText.replace(',', '.');
		doubleString = doubleString.split(" ")[2];
        final = 0;
		doubleString = parseFloat(doubleString).toFixed(2);
      	final = Math.round(final * 100) / 100;
      	final = final.toString().split(".");
        document.getElementsByClassName('footerText')[0].innerText = "Total: R$ " + final[0] + "," + 
        (final[1].length==1 ? final[1]+"0" : final[1]);
    }
</script>
<title>Ô, Bigode!</title>

</head>
<body>
	<div class="header clearfix" align="center">
		<a href="index.jsp"> <img alt="LogoHorizontal"
			class="img-responsive" height=40% width=40%
			src="./img/Marca/bigode-marca-horizontal.png"></a>
	</div>

	<div>

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
					<button id="dividir-conta" class="btn btn-novo-pedido show">
						<strong> Dividir conta </strong>
					</button>
				</div>

				<div class="col-xs-12">
					<br>
					<p align="center">
						<strong> Ou </strong>
					<p>
				</div>

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

			<div id="escolha" class="col-xs-12">
				<form action="">
					<input id="percent" style="margin-right: 2%;" type="checkbox"
						name="gorjeta" value="sim">Quero pagar os 10% do
					atendimento
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
			String totalFinal = "";
			ArrayList<String> results = new ArrayList<String>();
			results = bdg.listaPedidos(Integer.parseInt(request.getParameter("sessao")));
		%>
		<div id="pedidos" class="col-xs-12" style="margin-bottom: 15%;">
			<br>
			<p class="titulo">Lista de Pedidos</p>

			<%
				int balde = 0;
				int cont = 0;
				for (int x = 0; x < results.size(); x += 4) {
					if (balde != Integer.parseInt(results.get(x + 3))) {
						balde = Integer.parseInt(results.get(x + 3));
						if (cont > 0) {
							out.println("</div>");
						}
						cont++;
						out.println(
								"<div id='pedido' style='margin-top: 2%;' class='font-texto row'> <p class='margin-menu'>Pedido"
										+ cont + "</p>");
					}
			%>
			<div class="col-xs-12 produto-borda">
				<div class="col-xs-6">
					<p class="nome-produto" align="left"><%=results.get(x + 1)%>x
						<%=results.get(x)%>(s)
					</p>
				</div>
				<div class="col-xs-6">
					<p class="preco-produto" align="right">
						R$<%=Integer.parseInt(results.get(x+1))*Double.parseDouble(results.get(x + 2))%></p>
					<%
						total += Integer.parseInt(results.get(x+1))*Double.parseDouble(results.get(x + 2));
					%>

				</div>

			</div>
			<%
				}
			%>

		</div>

	</div>

	<div id="footerBar">
		<!-- Flow: Botao aparece apenas apos selecionar Pedir Conta -> Pagar Sozinho -->
		<div id="botao-pagar" class="button-place right" style="display: none">
			<form name="fimPedidoForm" action="fimPedido" method="POST">
				<input type="hidden" name="preco" id="preco" value=""> <input
					type="hidden" name="idSessao"
					value="<%=request.getParameter("sessao")%>">
			</form>

			<button id="submit-btn" class="button-pedido button-2d"
				onclick="javascript: passaTotal();document.fimPedidoForm.submit()">
				<p class="font-pedido">Pagar conta</p>
			</button>
		</div>
		<p class="footerText margin-menu" id="total">
			Total: R$
			<%=total%></p>
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
                location.href = "menu.jsp?codMesa=<%=request.getParameter("codMesa")%>
		&bar=1&sessao="
					+ sessao + "&flag=n";
		};
		document.getElementById("botao-pagar").onclick = function() {
			location.href = "volte_sempre.jsp";
		};
	</script>


</body>
</html>