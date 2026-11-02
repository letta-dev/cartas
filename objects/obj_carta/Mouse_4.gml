if (instance_exists(obj_fala)) instance_destroy(obj_fala)
// Se outra carta já pegou o clique neste frame, ignora
if (global.carta_clicada_neste_frame) exit;

// Se for mulligan → vira pre_escolha
if (estado_carta == "mulligan") {
    if (global.escolhidas < global.qtd_cartas_extras) {
        estado_carta = "pre_escolha";
        global.escolhidas++;
        global.carta_clicada_neste_frame = true; // Ativa a trava
        scr_reposicionar_bases();
        scr_reposicionar_mulligan();
        exit;
    }
}
// Se for pre_escolha → volta para mulligan
else if (estado_carta == "pre_escolha") {
    estado_carta = "mulligan";
    global.escolhidas--;
    global.carta_clicada_neste_frame = true; // Ativa a trava
    scr_reposicionar_bases();
    scr_reposicionar_mulligan();
    exit;
}

else if (estado_carta == "mao") || (estado_carta == "coringa")
{
    // Conta quantas cartas já estão na mesa
    var cartas_na_mesa = 0;

    with (obj_carta)
    {
        if (estado_carta == "mesa") {
            cartas_na_mesa++;
        }
    }

    // Só permite jogar se não ultrapassar o limite
    if (cartas_na_mesa < global.limite_mesa)
    {
        // Guarda o ID da carta da condição
        var inst_condicao = noone;

        with (obj_carta)
        {
            if (estado_carta == "rodada_condicao") {
                inst_condicao = id;
            }
        }

        // Se encontrou a carta da condição
        if (inst_condicao != noone && instance_exists(inst_condicao))
        {
            // --- VARIÁVEIS DE JUICE PARA O ARREMESSO ---
            var espalhamento_x = 25; // O quão espalhadas elas ficam para os lados
            var espalhamento_y = 15; // O quão espalhadas para cima/baixo
            
            // Define o destino final com a variação aleatória
            destino_x = inst_condicao.x + random_range(-espalhamento_x, espalhamento_x);
            destino_y = (inst_condicao.y + 20) + random_range(-espalhamento_y, espalhamento_y);

            // Guarda a posição de partida para o cálculo da curva física
            inicio_x = x;
            inicio_y = y;

            // Configura a física da rotação (Giro no ar)
            rotacao_inicial = image_angle;
            rotacao_alvo = random_range(-15, 15); // Ângulo final levemente torto na mesa

            // Reinicia o progresso da interpolação
            progresso_animacao = 0;

            // Inicia a animação
            animacao_ativa = true;
            atraso_animacao = 0;

            // Atualiza o estado da instância correta
            estado_carta = "mesa";
        }
    }
}
else if (estado_carta == "mesa")
{
    // Volta para a mão
    estado_carta = "mao";
    
    // Reseta a rotação para ela voltar reta e organizada para a mão
    image_angle = 0; 

    // Reorganiza todas as cartas que estão na mão
    scr_reposicionar_mao();
}

/*
if (instance_exists(obj_fala)) instance_destroy(obj_fala)
// Se outra carta já pegou o clique neste frame, ignora
if (global.carta_clicada_neste_frame) exit;

// Se for mulligan → vira pre_escolha
if (estado_carta == "mulligan") {
    if (global.escolhidas < global.qtd_cartas_extras) {
        estado_carta = "pre_escolha";
        global.escolhidas++;
        global.carta_clicada_neste_frame = true; // Ativa a trava
        scr_reposicionar_bases();
        scr_reposicionar_mulligan();
        exit;
    }
}
// Se for pre_escolha → volta para mulligan
else if (estado_carta == "pre_escolha") {
    estado_carta = "mulligan";
    global.escolhidas--;
    global.carta_clicada_neste_frame = true; // Ativa a trava
    scr_reposicionar_bases();
    scr_reposicionar_mulligan();
    exit;
}

else if (estado_carta == "mao") || (estado_carta == "coringa")
{
    // Conta quantas cartas já estão na mesa
    var cartas_na_mesa = 0;

    with (obj_carta)
    {
        if (estado_carta == "mesa") {
            cartas_na_mesa++;
        }
    }

    // Só permite jogar se não ultrapassar o limite
    if (cartas_na_mesa < global.limite_mesa)
    {
        // Guarda o ID da carta da condição
        var inst_condicao = noone;

        with (obj_carta)
        {
            if (estado_carta == "rodada_condicao") {
                inst_condicao = id;
            }
        }

        // Se encontrou a carta da condição
        if (inst_condicao != noone && instance_exists(inst_condicao))
        {
            // Define o destino da carta jogada
            destino_x = inst_condicao.x;
            destino_y = inst_condicao.y + 20;

            // Inicia a animação
            animacao_ativa = true;
            atraso_animacao = 0;

            // Atualiza o estado da instância correta
            estado_carta = "mesa";
        }
    }
}

else if (estado_carta == "mesa")
{
    // Volta para a mão
    estado_carta = "mao";

    // Reorganiza todas as cartas que estão na mão
    scr_reposicionar_mao();
}





