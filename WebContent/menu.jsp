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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    </head>
    <body>
        <script type="text/javascript">
            function modifyQty(val, elem) {
                var input = elem.parentElement.parentElement
                        .getElementsByClassName('display')[0];
                var new_qty = parseInt(input.value, 10) + val;
                if (new_qty < 0) {
                    new_qty = 0;
                }

                input.value = new_qty;

                updateTotal();

                return new_qty;
            }

            function modifyQtyBlur(elem) {
                var new_qty = parseInt(elem.value, 10);
                if (new_qty < 0) {
                    new_qty = 0;
                }

                elem.value = new_qty;

                updateTotal();

                return new_qty;
            }

            function updateTotal() {
                var displays = document.getElementsByClassName('display');
                var prices = document.getElementsByClassName('preco-produto');
                var soma = 0, rounded = 0;
                for (var i = 0; i < displays.length; i++) {
                    rounded = roundToTwo(parseFloat(prices[i].innerText));
                    soma += (parseInt(displays[i].value, 10) * rounded);
                }

                soma += "";
                var number = soma.split(".");

                document.getElementsByClassName('footerText')[0].innerText = "Preço Total: R$ " + number[0] + "," + (number[1] ? number[1] : "00");

            }

            function roundToTwo(num) {
                return +(Math.round(num + "e+2") + "e-2");
            }

            function order() {
                var displays = document.getElementsByClassName('display');
                var prices = document.getElementsByClassName('preco-produto');
                var names = document.getElementsByClassName('nome-produto');
                var ids = document.getElementsByClassName('id_prod');
                var mesa = getQueryVariable('codMesa');

                var list = new Array();
                for (var i = 0; i < displays.length; i++) {
                    var item = {};
                    if (parseInt(displays[i].value, 10) > 0) {
                        item.id = ids[i].value;
                        item.qty = displays[i].value;
                        item.mesa = mesa;
                    }
                    list.push(item);
                }

                var space = document.getElementsByClassName('footerText')[0].innerText.split(" ");

                var order = {
                    list: list
                }

                var jString = JSON.stringify(order);
                document.getElementById('jsonPedido').value = jString;



            }
            
    function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) {
                        return pair[1];
                    }
                }
                
            }
        </script>



        <div class="header clearfix" align="center">
            <a href="index.jsp"> <img alt="LogoHorizontal"
                                      class="img-responsive" height=40% width=40%
                                      src="./img/Marca/bigode-marca-horizontal.png">
            </a>
        </div>
        <%
            BigodeDAO bgd = new BigodeDAOImpl();
            String nome = bgd.getNomeBar(Integer.parseInt(request.getParameter("bar")));

        %>
        <div id="menu-title">
            <p class="titulo">Peca tudo o que quiser! ;)</p>
            <!-- append templateName aqui  -->
            <p>Você está na Mesa <%=request.getParameter("codMesa")%> do Bar <%=nome%></p>
            <p class="aviso">O que você pedir por aqui será incluido na conta
                da sua mesa e será pago tudo junto quando sua conta vier.</p>
        </div>

        <%

            ArrayList<String> products = new ArrayList<String>();
            products = bgd.listaProduto(Integer.parseInt(request.getParameter("codMesa")));
        %>

        <%
            for (int i = 0; i < products.size(); i += 4) {
                String pic = products.get(i + 2);
        %>

        <div class="container produto-borda">

            <div class="row">
                <div class="col-xs-4">
                    <img class="imagem-produto" src="data:image/jpeg;base64,<%=pic%>">
                    <!--  <img alt="default-placeholder" class="imagem-produto" src="img/default-placeholder.png"
                            width="100%" height="100%"> -->
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
                                <input type="hidden" class='id_prod' value="<%=products.get(i + 3)%>">
                            </p>
                        </div>
                    </div>
                    <div class="row no-gutters contador">
                        <div class="col-xs-3">
                            <button class="button-2d down" onclick="modifyQty(-1, this)">-</button>

                        </div>
                        <div class="col-xs-2" style="width: 30%;">
                            <input class="display" id="qty" onblur="modifyQtyBlur(this)"
                                   value="0" />

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
                <button id="submit-btn" class="button-pedido button-2d" onclick="order();
                        jsonForm.submit()">
                    <p class="font-pedido">Fazer Pedido</p>
                </button>
            </div>
            <p class="footerText">Preço Total: R$ 0,00</p>
        </div>

        <form name='jsonForm' action='Pedido' method='Post'>
            <input type='hidden' id='jsonPedido' name='jsonPedido' class='jsonPedido'>

        </form>
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
