function scr_validar_expressao() {

    var valor_banca = 0;
    var banca_encontrada = false;
    var condicao = "";
    var condicao_encontrada = false;

    var cartas_mesa = [];
    var quantidade_iguais = 0;

    // Resultado da ameaça
    var ameaca_sucesso = false;

    // Reseta os bônus de cada jogada
    global.bonus_jogada_dupla_pontos = 0;
    global.bonus_jackpot_pontos = 0;

    // --------------------------------------------------
    // Calcula a chance da ameaça
    // --------------------------------------------------

    if (global.coringa_ativo)
    {
        var chance_ameaca = min(global.acerto_consecutivo / global.coringa,1);
		

        ameaca_sucesso = (random(1) <= chance_ameaca);
    }

    // --------------------------------------------------
    // 1. Identifica banca, condição e cartas na mesa
    // --------------------------------------------------

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

    // --------------------------------------------------
    // 2. Inicializa o resultado
    // --------------------------------------------------

    var resultado = (array_length(cartas_mesa) > 0);

    if (!ameaca_sucesso)
    {
        resultado =
            resultado &&
            banca_encontrada &&
            condicao_encontrada;
    }

    // --------------------------------------------------
    // 3. Valida individualmente todas as cartas
    // --------------------------------------------------

    var valor_primeira_carta = -1;
    var cartas_duplas_iguais = false;

    for (var i = 0; i < array_length(cartas_mesa); i++)
    {
        var carta_id = cartas_mesa[i];

        if (instance_exists(carta_id))
        {
            var valor_carta = carta_id.valor;
            var carta_valida = false;

            // Verifica igualdade entre as duas cartas
            if (i == 0)
            {
                valor_primeira_carta = valor_carta;
            }
            else if (i == 1)
            {
                cartas_duplas_iguais =
                    (valor_carta == valor_primeira_carta);
            }

            // Verifica igualdade com a banca
            if (banca_encontrada && valor_carta == valor_banca)
            {
                quantidade_iguais++;
            }

            // Ameaça funcionou
            if (ameaca_sucesso)
            {
                carta_valida = true;
            }
            else
            {
                if (condicao == "maior")
                {
                    carta_valida =
                        (valor_carta >= valor_banca);
                }
                else if (condicao == "menor")
                {
                    carta_valida =
                        (valor_carta <= valor_banca);
                }
                else if (condicao == "igual")
                {
                    carta_valida =
                        (valor_carta == valor_banca);
                }
            }

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

    // --------------------------------------------------
    // 4. Processa a ameaça
    // --------------------------------------------------

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

    // --------------------------------------------------
    // 5. Calcula os bônus somente se a jogada foi válida
    // --------------------------------------------------

    if (resultado)
    {
        var quantidade_cartas =
            array_length(cartas_mesa);

        // Bônus por igualdade com a banca
        if (quantidade_iguais > 0)
        {
            global.multiplicador_atual +=
                quantidade_iguais *
                global.incremento_multiplicador;
        }

        // Bônus de jogada dupla
        if (quantidade_cartas == 2)
        {
            switch (global.turno_atual)
            {
                case 1:
                    global.bonus_jogada_dupla_pontos = (global.pontos_por_acerto * 3);
                break;

                case 2:
                    global.bonus_jogada_dupla_pontos = (global.pontos_por_acerto * 2.5);
                break;

                case 3:
                    global.bonus_jogada_dupla_pontos = (global.pontos_por_acerto * 1.5);
                break;
            }

            // Jackpot
            if (
                cartas_duplas_iguais &&
                quantidade_iguais == 2
            )
            {
                global.bonus_jackpot_pontos = 1000;
            }
        }
    }

    // --------------------------------------------------
    // 6. Remove as cartas utilizadas da mão
    // --------------------------------------------------

    for (var i = 0; i < array_length(cartas_mesa); i++)
    {
        var carta_id = cartas_mesa[i];

        for (var j = 0; j < array_length(global.cartas_mao); j++)
        {
            if (global.cartas_mao[j] == carta_id)
            {
                array_delete(
                    global.cartas_mao,
                    j,
                    1
                );
                break;
            }
        }
    }

    // --------------------------------------------------
    // 7. Transforma as cartas utilizadas em histórico
    // --------------------------------------------------

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

    // --------------------------------------------------
    // 8. Entrega o resultado
    // --------------------------------------------------

    obj_confirma_turno.resultado = resultado;

    return resultado;
}

/*





function scr_validar_expressao() {

    var valor_banca = 0;
    var banca_encontrada = false;
    var condicao = "";
    var condicao_encontrada = false;

    var cartas_mesa = [];
    var quantidade_iguais = 0;

    // Reseta os bônus de cada jogada
    global.bonus_jogada_dupla_pontos = 0;
    global.bonus_jackpot_pontos = 0;

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

    if (!global.coringa_ativo)
    {
        resultado = resultado && banca_encontrada && condicao_encontrada;
    }

    // 3. Valida individualmente todas as cartas
    var valor_primeira_carta = -1;
    var cartas_duplas_iguais = false;

    for (var i = 0; i < array_length(cartas_mesa); i++)
    {
        var carta_id = cartas_mesa[i];

        if (instance_exists(carta_id))
        {
            var valor_carta = carta_id.valor;
            var carta_valida = false;

            // Verifica se as duas cartas possuem o mesmo valor
            if (i == 0)
            {
                valor_primeira_carta = valor_carta;
            }
            else if (i == 1)
            {
                cartas_duplas_iguais =
                    (valor_carta == valor_primeira_carta);
            }

            // Verifica igualdade com a banca
            if (banca_encontrada && valor_carta == valor_banca)
            {
                quantidade_iguais++;
            }

            // Coringa valida automaticamente
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

    // 5. Calcula os bônus somente se a jogada foi válida
    if (resultado)
    {
        var quantidade_cartas = array_length(cartas_mesa);

        // Bônus normal de igualdade com a banca
        if (quantidade_iguais > 0)
        {
            global.multiplicador_atual +=
                quantidade_iguais * global.incremento_multiplicador;
        }

        // Bônus fixo de jogada dupla conforme o turno
        if (quantidade_cartas == 2)
        {
            switch (global.turno_atual)
            {
                case 1:
                    global.bonus_jogada_dupla_pontos = 15;
                break;

                case 2:
                    global.bonus_jogada_dupla_pontos = 13;
                break;

                case 3:
                    global.bonus_jogada_dupla_pontos = 7;
                break;
            }

            // Jackpot: as duas cartas devem ser iguais
            // entre si e iguais à carta da banca
            if (
                cartas_duplas_iguais &&
                quantidade_iguais == 2
            )
            {
                global.bonus_jackpot_pontos = 1000;
            }
        }
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

    // 8. Entrega o resultado
    obj_confirma_turno.resultado = resultado;

    return resultado;
}