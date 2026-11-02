function scr_testar_rodada() {
    // 1. Gera os dados da rodada e do mulligan
	randomise()
    scr_gerar_rodada();
    scr_gerar_mulligan();
    
    // 2. Destrói instâncias anteriores para não acumular
    with (obj_carta) {
        instance_destroy();
    }
    
    // Configurações de Posição na Tela (Grid)
    var pos_x_centro = 200;     // Posição X central do grupo do turno
    var espacamento_x = 90;     // Distância horizontal entre Banca - Condição - Base
    
    var pos_y_inicial = 80;     // Y do primeiro turno (Linha 1)
    var espacamento_y = 110;     // Distância vertical entre cada linha/turno
    
    // --- LINHAS 1 A 5: Turnos (Banca - Condição - Carta Base) ---
    for (var i = 0; i < global.turnos_por_rodada; i++) {
        var y_linha = pos_y_inicial + (i * espacamento_y);
        
        // 1. Carta da Banca (Esquerda)
        var inst_banca = instance_create_layer(pos_x_centro, y_linha, "Instances", obj_carta);
        inst_banca.valor = global.cartas_banca[i];
        
        // 2. Condição (Meio) → usar variável separada para string
        var inst_cond = instance_create_layer(pos_x_centro + espacamento_x, y_linha, "Instances", obj_carta);
        inst_cond.tipo_condicao = global.condicoes[i];
        
        // 3. Carta Base (Direita)
        var inst_base = instance_create_layer(pos_x_centro + (espacamento_x * 2), y_linha, "Instances", obj_carta);
        inst_base.valor = global.cartas_base[i];
    }
    
    // --- LINHA 6: As 4 Cartas do Mulligan ---
    var y_mulligan = pos_y_inicial + (global.turnos_por_rodada * espacamento_y) + 30;
    var espacamento_mulligan = 80;
    var x_mulligan_inicial = pos_x_centro - 20;
    
    for (var j = 0; j < 4; j++) {
        var inst_mulligan = instance_create_layer(x_mulligan_inicial + (j * espacamento_mulligan), y_mulligan, "Instances", obj_carta);
        inst_mulligan.valor = global.opcoes_mulligan[j];
    }
}
