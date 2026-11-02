
function scr_validar_expressao() {
    var valor_banca, valor_mesa, condicao;
    var carta_mesa_id;

    // Pega os valores das instâncias
    with (obj_carta) {
        if (estado_carta == "rodada_banca") {
            valor_banca = valor;
        }
        else if (estado_carta == "mesa") {
            valor_mesa = valor;
            carta_mesa_id = id; // guarda referência da carta jogada
        }
        else if (estado_carta == "rodada_condicao") {
            condicao = tipo_condicao; // string: "maior", "menor", "igual"
        }
    }

    // Avalia a expressão
    var resultado = false;
    if (condicao == "maior") {
        resultado = (valor_mesa > valor_banca);
    }
    else if (condicao == "menor") {
        resultado = (valor_mesa < valor_banca);
    }
    else if (condicao == "igual") {
        resultado = (valor_mesa == valor_banca);
    }

    // Remove a carta jogada da mão
    if (carta_mesa_id != noone) {
        for (var i = 0; i < array_length(global.cartas_mao); i++) {
            if (global.cartas_mao[i] == carta_mesa_id) {
                array_delete(global.cartas_mao, i, 1);
                break;
            }
        }
    }
    // Marca as três cartas como histórico
    with (obj_carta) {
        if (estado_carta == "rodada_banca" || estado_carta == "rodada_condicao" || estado_carta == "mesa") {
            estado_carta = "historico";
        }
    }
	if (valor_mesa == 24) resultado = true
	if (valor_mesa == 24) global.usou_coringa = true else global.usou_coringa = false
	if (valor_mesa == 24) global.acerto_consecutivo = 0

    obj_confirma_turno.resultado = resultado;
	//var resultado = scr_validar_expressao();


    return resultado;
}