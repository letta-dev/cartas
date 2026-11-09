
function scr_validar_expressao() {
    
    var valor_banca = 0;
    var banca_encontrada = false;
    var condicao = "";
    var condicao_encontrada = false;

    // Armazena todas as cartas jogadas
    var cartas_mesa = [];
    var quantidade_iguais = 0;

    // 1. Identifica banca, condição e cartas na mesa
    for (var i = 0; i < instance_number(obj_carta); i++)
    {
        var carta_atual = instance_find(obj_carta, i);

        if (carta_atual != noone)
        {
            if (carta_atual.estado_carta == "rodada_banca")
            {
                valor_banca = carta_atual.valor;
                banca_encontrada = true;
            }
            else if (carta_atual.estado_carta == "rodada_condicao")
            {
                condicao = carta_atual.tipo_condicao;
                condicao_encontrada = true;
            }
            else if (carta_atual.estado_carta == "mesa")
            {
                array_push(cartas_mesa, carta_atual.id);
            }
        }
    }

    // 2. Inicializa o resultado
    var resultado = (array_length(cartas_mesa) > 0);

    // Sem coringa, precisamos encontrar banca e condição
    if (!global.coringa_ativo)
    {
        resultado = resultado && banca_encontrada && condicao_encontrada;
    }

    // 3. Valida individualmente todas as cartas
    for (var i = 0; i < array_length(cartas_mesa); i++)
    {
        var carta_id = cartas_mesa[i];

        if (instance_exists(carta_id))
        {
            var valor_carta = carta_id.valor;
            var carta_valida = false;

            // Verifica igualdade independentemente da condição
            if (banca_encontrada && valor_carta == valor_banca)
            {
                quantidade_iguais++;
            }

            // O coringa valida automaticamente todas as cartas
            if (global.coringa_ativo)
            {
                carta_valida = true;
            }
            else
            {
                if (condicao == "maior")
                {
                    carta_valida = (valor_carta >= valor_banca);
                }
                else if (condicao == "menor")
                {
                    carta_valida = (valor_carta <= valor_banca);
                }
                else if (condicao == "igual")
                {
                    carta_valida = (valor_carta == valor_banca);
                }
            }

            // Uma única falha invalida toda a jogada
            if (!carta_valida)
            {
                resultado = false;
            }
        }
        else
        {
            resultado = false;
        }
    }

    // 4. Processa o coringa
    if (global.coringa_ativo)
    {
        global.coringa_ativo = false;
        global.usou_coringa = true;
        global.acerto_consecutivo = 0;
    }
    else
    {
        global.usou_coringa = false;
    }

    // 5. Premia cartas iguais somente se a jogada inteira foi válida
    if (resultado && quantidade_iguais > 0)
    {
        global.multiplicador_atual +=
            quantidade_iguais * global.incremento_multiplicador;
    }

    // 6. Remove todas as cartas utilizadas da mão
    for (var i = 0; i < array_length(cartas_mesa); i++)
    {
        var carta_id = cartas_mesa[i];

        for (var j = 0; j < array_length(global.cartas_mao); j++)
        {
            if (global.cartas_mao[j] == carta_id)
            {
                array_delete(global.cartas_mao, j, 1);
                break;
            }
        }
    }

    // 7. Transforma as cartas utilizadas em histórico
    with (obj_carta)
    {
        if (
            estado_carta == "rodada_banca" ||
            estado_carta == "rodada_condicao" ||
            estado_carta == "mesa"
        )
        {
            estado_carta = "historico";
        }
    }

    // 8. Entrega o resultado ao objeto de confirmação
    obj_confirma_turno.resultado = resultado;

    return resultado;
}





/*
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

	
	//***** PREMIANDO CARTAS IGUAIS *****\\
	if (valor_mesa == valor_banca)
	{
		resultado = true
		global.multiplicador_atual += global.incremento_multiplicador
	}
	//if (valor_mesa == 24) resultado = true
	//if (valor_mesa == 24) global.usou_coringa = true else global.usou_coringa = false
	//if (valor_mesa == 24) global.acerto_consecutivo = 0
	if (global.coringa_ativo) 
	{
		resultado = true
		global.coringa_ativo = false
		global.usou_coringa = false
		global.acerto_consecutivo = 0
		global.usou_coringa = true
	}
	else global.usou_coringa = false

    obj_confirma_turno.resultado = resultado;


    return resultado;
}