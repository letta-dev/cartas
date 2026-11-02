//novo step event obj_carta

if (variable_instance_exists(id, "tipo_condicao")) {
    switch (tipo_condicao) {
        case "igual":  sprite_index = spr_igual;  break;
        case "maior":  sprite_index = spr_maior;  break;
        case "menor":  sprite_index = spr_menor;  break;
    }
} else 
{
	switch (valor) 
	{
	    case 1:  sprite_index = spr_1;  break;
	    case 2:  sprite_index = spr_2;  break;
	    case 3:  sprite_index = spr_3;  break;
	    case 4:  sprite_index = spr_4;  break;
	    case 5:  sprite_index = spr_5;  break;
	    case 6:  sprite_index = spr_6;  break;
	    case 7:  sprite_index = spr_7;  break;
	    case 8:  sprite_index = spr_8;  break;
	    case 9:  sprite_index = spr_9;  break;
	    case 10: sprite_index = spr_10; break;
	    case 11: sprite_index = spr_11; break;
	    case 12: sprite_index = spr_12; break;
	    case 13: sprite_index = spr_13; break;
	    case 14: sprite_index = spr_14; break;
	    case 15: sprite_index = spr_15; break;
	    case 16: sprite_index = spr_16; break;
	    case 17: sprite_index = spr_17; break;
	    case 18: sprite_index = spr_18; break;
	    case 19: sprite_index = spr_19; break;
	    case 20: sprite_index = spr_20; break;

	    // Condições especiais
	    case 21: sprite_index = spr_igual; break;
	    case 22: sprite_index = spr_maior; break;
	    case 23: sprite_index = spr_menor; break;
		case 24: sprite_index = spr_coringa; break;
	}
}

// Só aplica as escalas estáticas se a carta não estiver no meio do "voo" animado
if (!animacao_ativa) {
    switch (estado_carta) {
        case "base":
			image_xscale = 1;
			image_yscale = 1;
            image_angle = 0; // Reseta rotação ao repousar
            break;
        case "banca":
			image_xscale = 1;
			image_yscale = 1;
            image_angle = 0;
            break;
        case "condicao":
			image_xscale = 1;
			image_yscale = 1;
            image_angle = 0;
            break;
        case "mulligan":
			image_xscale = 0.8;
			image_yscale = 0.8;
            image_angle = 0;
            break;
        case "mao":
			image_xscale = 1;
			image_yscale = 1;
            image_angle = 0;
            break;
        case "mesa":
			image_xscale = 1;
			image_yscale = 1;
            // Mantém o image_angle gerado aleatoriamente no ar ao pousar!
            break;
			
		case "pre_escolha":
			image_xscale = 1.2;
			image_yscale = 1.2;
            image_angle = 0;
			break;
			
		case "historico":
			image_xscale = 0.8;
			image_yscale = 0.8;
            image_angle = 0;
			break;
		case "arquivada_no_historico":
			image_xscale = 0.8;
			image_yscale = 0.8;
            image_angle = 0;
			break;
			
		case "coringa":
			image_xscale = 1.2;
			image_yscale = 1.2;
            image_angle = 0;
			break;
    }
}

//****** ANIMAÇÃO ******\\
// Espera sua vez de começar a animação
if (atraso_animacao > 0) {
    atraso_animacao--;
}
else if (animacao_ativa) {
    
    // Se a animação for para a mesa, aplica o efeito de parábola e rotação (Juice!)
    if (estado_carta == "mesa") {
        // Avança o progresso linear do voo (de 0 a 1)
        progresso_animacao += velocidade_animacao;
        
        if (progresso_animacao >= 1) {
            progresso_animacao = 1;
            animacao_ativa = false; // Finaliza
        }
        
        // Interpolação X e Y linear de base
        var atual_x = lerp(inicio_x, destino_x, progresso_animacao);
        var atual_y = lerp(inicio_y, destino_y, progresso_animacao);
        
        // Cria a curva do arco no ar (seno vai de 0 -> 1 -> 0)
        var modificador_arco = sin(progresso_animacao * pi) * altura_arco;
        
        // Posição final na tela
        x = atual_x;
        y = atual_y - modificador_arco; // Subtrai para subir na tela do GameMaker
        
        // Efeito de Rotação: dá 1 volta completa (360) no ar e termina no ângulo alvo tortinho
        //image_angle = lerp(rotacao_inicial + 360, funcao_rotacao_alvo(), progresso_animacao);
		image_angle = lerp(rotacao_inicial + 360, rotacao_alvo, progresso_animacao);
        
        // Efeito extra de Escala: a carta aumenta levemente enquanto está no "topo" do arco
        var escala_juice = 1 + (sin(progresso_animacao * pi) * 0.15); 
        image_xscale = escala_juice;
        image_yscale = escala_juice;
    }
    // Caso seja qualquer outra animação do jogo (mão, histórico, etc.), mantém o comportamento original em linha reta
    else {
        x = lerp(x, destino_x, 0.25);
        y = lerp(y, destino_y, 0.25);

        if (point_distance(x, y, destino_x, destino_y) < 1) {
            x = destino_x;
            y = destino_y;
            animacao_ativa = false;
        }
    }
}


/*
if (variable_instance_exists(id, "tipo_condicao")) {
    switch (tipo_condicao) {
        case "igual":  sprite_index = spr_igual;  break;
        case "maior":  sprite_index = spr_maior;  break;
        case "menor":  sprite_index = spr_menor;  break;
    }
} else 
{
	switch (valor) 
	{
	    case 1:  sprite_index = spr_1;  break;
	    case 2:  sprite_index = spr_2;  break;
	    case 3:  sprite_index = spr_3;  break;
	    case 4:  sprite_index = spr_4;  break;
	    case 5:  sprite_index = spr_5;  break;
	    case 6:  sprite_index = spr_6;  break;
	    case 7:  sprite_index = spr_7;  break;
	    case 8:  sprite_index = spr_8;  break;
	    case 9:  sprite_index = spr_9;  break;
	    case 10: sprite_index = spr_10; break;
	    case 11: sprite_index = spr_11; break;
	    case 12: sprite_index = spr_12; break;
	    case 13: sprite_index = spr_13; break;
	    case 14: sprite_index = spr_14; break;
	    case 15: sprite_index = spr_15; break;
	    case 16: sprite_index = spr_16; break;
	    case 17: sprite_index = spr_17; break;
	    case 18: sprite_index = spr_18; break;
	    case 19: sprite_index = spr_19; break;
	    case 20: sprite_index = spr_20; break;

	    // Condições especiais
	    case 21: sprite_index = spr_igual; break;
	    case 22: sprite_index = spr_maior; break;
	    case 23: sprite_index = spr_menor; break;
		case 24: sprite_index = spr_coringa; break;
	}
}


switch (estado_carta) {
    case "base":
        // comportamento da carta base
		image_xscale = 1
		image_yscale = 1
        break;
    case "banca":
        // comportamento da carta da banca
		image_xscale = 1
		image_yscale = 1
        break;
    case "condicao":
        // comportamento da condição (normalmente só exibe sprite)
		image_xscale = 1
		image_yscale = 1
        break;
    case "mulligan":
        // comportamento do mulligan
		image_xscale = 0.8
		image_yscale = 0.8
        break;
    case "mao":
        // comportamento da carta na mão		
		image_xscale = 1
		image_yscale = 1
        break;
    case "mesa":
        // comportamento da carta na mesa
		image_xscale = 1
		image_yscale = 1
        break;
		
	case "pre_escolha":
		image_xscale = 1.2
		image_yscale = 1.2
		break
		
	case "historico":
		image_xscale = 0.8
		image_yscale = 0.8
		break
	case "arquivada_no_historico":
		image_xscale = 0.8
		image_yscale = 0.8
		break
		
	case "coringa":
		image_xscale = 1.2
		image_yscale = 1.2
		break
		
}

//****** ANIMAÇÃO ******\\
// Espera sua vez de começar a animação
if (atraso_animacao > 0) {
    atraso_animacao--;
}
else if (animacao_ativa) {
    // Deslocamento suave até o destino
    x = lerp(x, destino_x, 0.25);
    y = lerp(y, destino_y, 0.25);

    // Finaliza quando estiver suficientemente perto
    if (point_distance(x, y, destino_x, destino_y) < 1) {
        x = destino_x;
        y = destino_y;
        animacao_ativa = false;
    }
}


