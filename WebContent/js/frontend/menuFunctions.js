function modifyQty(val, elem) {
    var input = elem.parentElement.parentElement.getElementsByClassName('display')[0];
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

    document.getElementsByClassName('footerText')[0].innerText = "Pre�o Total: R$ " + number[0] + "," + (number[1] ? number[1] : "00");

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

function onlyNumbers(evt) {
    if (evt.which < 48 || evt.which > 57)
    {
        evt.preventDefault();
    }
}

function templateName(mesa, bar) {
    return '<p>Voc� est� na Mesa ' + mesa + ' do Bar ' + bar + '</p>';
}

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