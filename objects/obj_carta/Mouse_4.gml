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

else if (estado_carta == "mao") 
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
		// Verifica se pode adicionar outra carta à mesa
		var pode_adicionar_carta = true;

		// Se já existe uma carta na mesa, estamos tentando fazer jogada dupla
		if (cartas_na_mesa >= 1)
		{
		    // Calcula os turnos restantes, incluindo o atual
		    var turnos_restantes = global.turnos_por_rodada - global.turno_atual + 1;

		    // Quantidade de cartas disponíveis
		    var cartas_na_mao = array_length(global.cartas_mao);

		    // Só permite a segunda carta se houver cartas excedentes
		    pode_adicionar_carta = (cartas_na_mao > turnos_restantes);
		}

		// Só permite jogar se respeitar os dois limites
		if (cartas_na_mesa < global.limite_mesa && pode_adicionar_carta)
		{
		
		
        // Guarda o ID da carta da condição
        var inst_condicao = noone;

        with (obj_carta)
        {
            if (estado_carta == "rodada_condicao") {
                inst_condicao = id;
            }
        }


if (inst_condicao != noone && instance_exists(inst_condicao))
{
    // Verifica se o coringa está ativo para decidir qual animação fazer
    if (global.coringa_ativo)
    {
        // --- NOVA ANIMAÇÃO COM O CORINGA (ETAPADAS) ---
        
        // 1. Garante que existe um obj_ameaca na sala (se não houver, cria na posição inicial padrão dele, ex: x=1200, y=400)
        var ameaca = instance_find(obj_ameaca, 0);
        if (ameaca == noone) {
            ameaca = instance_create_layer(1200, 400, layer, obj_ameaca);
        }
        
        // Guarda o ID da ameaça na carta para podermos controlá-la durante a animação
        meu_obj_ameaca = ameaca;
        
        // Salva a posição inicial da ameaça para ela poder voltar na Etapa 4
        meu_obj_ameaca.inicio_x = meu_obj_ameaca.x;
        meu_obj_ameaca.inicio_y = meu_obj_ameaca.y;
		meu_obj_ameaca.destino_retorno_x = meu_obj_ameaca.x; // Guarda onde ela estava originalmente
		meu_obj_ameaca.destino_retorno_y = meu_obj_ameaca.y; // Guarda onde ela estava originalmente
        
        // Define o alvo intermediário da Etapa 1

		inicio_x = x;
		inicio_y = y;
		destino_x = 1000;
		destino_y = 400;

		// Guarda o destino final: posição da carta de condição
		var espalhamento_x = 25; 
        var espalhamento_y = 15; 
		destino_final_x = inst_condicao.x + random_range(-espalhamento_x, espalhamento_x);;
		destino_final_y = (inst_condicao.y + 20) + random_range(-espalhamento_y, espalhamento_y);
        
        // Configurações visuais de rotação
        rotacao_inicial = image_angle;
        rotacao_alvo = random_range(-30, 30);
        
        // Reseta o progresso e define a etapa inicial da animação do coringa
        progresso_animacao = 0;
        etapa_coringa = 1; // Começa a Etapa 1: Carta vai para (1000, 400)
        
        animacao_ativa = true;
        atraso_animacao = 0;
        
        // Atualiza o estado da carta
        estado_carta = "mesa";
    }
    else
    {
        // --- ANIMAÇÃO PADRÃO (Atual) ---
        var espalhamento_x = 25; 
        var espalhamento_y = 15; 
        
        destino_x = inst_condicao.x + random_range(-espalhamento_x, espalhamento_x);
        destino_y = (inst_condicao.y + 20) + random_range(-espalhamento_y, espalhamento_y);

        inicio_x = x;
        inicio_y = y;

        rotacao_inicial = image_angle;
        rotacao_alvo = random_range(-15, 15); 

        progresso_animacao = 0;
        animacao_ativa = true;
        atraso_animacao = 0;

        estado_carta = "mesa";
    }
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





