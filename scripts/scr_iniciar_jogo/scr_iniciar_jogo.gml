//***** ANIMAÇÃO *****\\




function scr_iniciar_jogo() {
    // 1. Sorteia rodada e mulligan
    randomise();
    scr_gerar_rodada();
    scr_gerar_mulligan();

    // 2. Ordena os valores
    array_sort(global.cartas_base, true);
    array_sort(global.opcoes_mulligan, true);

    // 3. Limpa cartas anteriores
    with (obj_carta) {
		if (valor != 24) instance_destroy();
    }

    // 4. Centro da room
    var centro_x = ((room_width / 2)-320);
    var centro_y = ((room_height / 2)-180);
    var espacamento_x = 90;

    var y_base = centro_y + 250;
    var y_mulligan = centro_y - 180;

    // Ponto de origem das animações
    var origem_x = centro_x;
    var origem_y = room_height - 1000;

    // 5. Cria as cartas base centralizadas
    var total_bases = array_length(global.cartas_base);

    for (var i = 0; i < total_bases; i++) {
        var destino_x = centro_x
            + (i - (total_bases - 1) / 2) * espacamento_x;

        var inst_base = instance_create_layer(
            origem_x, origem_y, "Instances", obj_carta
        );

        inst_base.valor = global.cartas_base[i];
        inst_base.estado_carta = "base";

        inst_base.destino_x = destino_x;
        inst_base.destino_y = y_base;
        inst_base.animacao_ativa = true;
        inst_base.atraso_animacao = i * 8;
    }

    // 6. Cria as cartas do mulligan centralizadas
    var total_mulligan = array_length(global.opcoes_mulligan);

    for (var j = 0; j < total_mulligan; j++) {
        var destino_x = centro_x
            + (j - (total_mulligan - 1) / 2) * espacamento_x;

        var inst_mulligan = instance_create_layer(
            origem_x, origem_y, "Instances", obj_carta
        );

        inst_mulligan.valor = global.opcoes_mulligan[j];
        inst_mulligan.estado_carta = "mulligan";

        inst_mulligan.destino_x = destino_x;
        inst_mulligan.destino_y = y_mulligan;
        inst_mulligan.animacao_ativa = true;
        inst_mulligan.atraso_animacao = (total_bases + j) * 8;
    }
}