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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
	<title>Ô, Bigode!</title>
</head>
<body>
	<div class="header clearfix" align="center">
		<a href="index.jsp"> <img alt="LogoHorizontal"
			class="img-responsive" height=40% width=40%
			src="./img/Marca/bigode-marca-horizontal.png"></a>
	</div>
	
	<div class="container">
	
		<div id="confirmado-title" class="col-xs-12">
	            <p class="titulo">O pedido já foi para a cozinha!</p>
	            <p class="font-texto"> Daqui a pouco o garçom chegará com tudo o que você pediu, já foi
	            	meio caminho andado. </p>
		</div>
		
		<div id="escolha" class="row">
			
			<div id="btn-container" class="col-xs-10 col-xs-offset-1">
				<button class="btn btn-novo-pedido show">
					<strong> Fazer um novo pedido </strong>
				</button>
			</div>
			
			
			<div class="col-xs-12">
				<br>
				<p align="center"> <strong> Ou </strong> <p>
			</div>

			<div id="btn-container" class="col-xs-10 col-xs-offset-1">
				<button class="btn btn-fechar-conta show">
						<strong> Pedir a conta </strong>
				</button>
			</div>
		
		</div>
		
		<div class="row">
			<br>
		</div>
		
		<div id="pedidos" class="col-xs-12">
			<div id="pedido1" class="row">
				<strong> Pedido 1 </strong>
				<div class="col-xs-12 produto-borda">
					<div class="col-xs-6">
						<p class="nome-produto" align="left">Coxinha</p>
					</div>
					<div class="col-xs-6">
						<p class="preco-produto" align="right">R$ 100,00</p>
					</div>
					
				</div>
			
			</div>
		</div>

	</div>
	
	<div id="footerBar">
	        <p class="footerText">Preço Total: R$ 0,00</p>
	</div>
</body>
</html>