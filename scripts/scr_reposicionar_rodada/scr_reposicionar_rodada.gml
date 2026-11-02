//***** ANIMAÇÃO *****\\



function scr_reposicionar_rodada() {
    var centro_x = ((room_width / 2)-320);
    var centro_y = ((room_height / 2)-180);

    var espacamento_x = 100;
    var espacamento_y = 100;
    var y_rodada = centro_y - 150;

    var origem_x = centro_x;
    var origem_y = room_height - 1000;

    // Índice do turno atual
    var idx = global.turno_atual - 1;

    // Cria a carta da banca
    var carta_banca = global.cartas_banca[idx];

    var inst_banca = instance_create_layer(
        origem_x, origem_y, "Instances", obj_carta
    );

    inst_banca.valor = carta_banca;
    inst_banca.estado_carta = "rodada_banca";

    inst_banca.destino_x = centro_x;
    inst_banca.destino_y = y_rodada;
    inst_banca.animacao_ativa = true;
    inst_banca.atraso_animacao = 0;

    // Cria a condição da rodada
    var condicao = global.condicoes[idx];

    var inst_cond = instance_create_layer(
        origem_x, origem_y, "Instances", obj_carta
    );

    inst_cond.tipo_condicao = condicao;
    inst_cond.estado_carta = "rodada_condicao";

    // Define o destino da condição
    if (condicao == "menor") {
        inst_cond.destino_x = centro_x - espacamento_x;
        inst_cond.destino_y = y_rodada;
    }
    else if (condicao == "maior") {
        inst_cond.destino_x = centro_x + espacamento_x;
        inst_cond.destino_y = y_rodada;
    }
    else if (condicao == "igual") {
        inst_cond.destino_x = centro_x;
        inst_cond.destino_y = y_rodada + espacamento_y;
    }

    inst_cond.animacao_ativa = true;
    inst_cond.atraso_animacao = 8;
}