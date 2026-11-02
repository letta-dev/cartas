function scr_organizar_historico() {

    // 1. Configurações da Pilha de Histórico
    var ancoragem_x = room_width - 150;
    var ancoragem_y = room_height - 100;

    var deslocamento_vertical = 35;

    var limite_meio_tela = ((room_height / 2)-180);

    // 2. Move as cartas já arquivadas para cima
    with (obj_carta) {
        if (estado_carta == "arquivada_no_historico") {

            // Atualiza o destino para subir suavemente
            destino_y -= deslocamento_vertical;

            animacao_ativa = true;
            atraso_animacao = 0;

            var distancia_total = ancoragem_y - limite_meio_tela;
            var distancia_atual = y - limite_meio_tela;

            image_alpha = clamp(distancia_atual / distancia_total, 0, 1);

            // Destrói quando realmente chegar ao limite
            if (!animacao_ativa && y <= limite_meio_tela) {
                instance_destroy();
            }
        }
    }

    // 3. Calcula o centro das cartas do turno atual
    var soma_x = 0;
    var soma_y = 0;
    var total_cartas_turno = 0;

    with (obj_carta) {
        if (estado_carta == "historico") {
            soma_x += x;
            soma_y += y;
            total_cartas_turno++;
        }
    }

    // 4. Reposicionamento das cartas do turno atual
    if (total_cartas_turno > 0) {

        var centro_original_x = soma_x / total_cartas_turno;
        var centro_original_y = soma_y / total_cartas_turno;

        with (obj_carta) {
            if (estado_carta == "historico") {

                var diferenca_centro_x = x - centro_original_x;
                var diferenca_centro_y = y - centro_original_y;

                var calcular_destino_x = ancoragem_x + (diferenca_centro_x * 0.5);
                var calcular_destino_y = ancoragem_y + (diferenca_centro_y * 0.5);

                // Define os destinos da animação
                destino_x = calcular_destino_x;
                destino_y = calcular_destino_y;

                animacao_ativa = true;
                atraso_animacao = 0;

                image_alpha = 1.0;

                depth = -100 - (global.turno_total * 3);

                estado_carta = "arquivada_no_historico";
            }
        }
    }
}
