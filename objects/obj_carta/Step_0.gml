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


//NOVA ANIMAÇÃO - STEP EVENT OBJ_CARTA

//****** ANIMAÇÃO ******\\
// Espera sua vez de começar a animação

if (atraso_animacao > 0) {
    atraso_animacao--;
}
else if (animacao_ativa) {
    
    //=========================================
    // ANIMAÇÃO DE CORINGA
    //=========================================
    if (estado_carta == "mesa" && global.coringa_ativo) {
        
        switch (etapa_coringa) {
            
            // ETAPA 1: Carta vai até (1000, 400)
            case 1:
                progresso_animacao += velocidade_animacao;
                
                if (progresso_animacao >= 1) {
                    progresso_animacao = 1;
                    
                    etapa_coringa = 2;
                    progresso_animacao = 0;
                    
                    if (instance_exists(meu_obj_ameaca)) {
                        meu_obj_ameaca.inicio_x = meu_obj_ameaca.x;
                        meu_obj_ameaca.inicio_y = meu_obj_ameaca.y;
                    }
                }
                
                var atual_x = lerp(inicio_x, 1000, progresso_animacao);
                var atual_y = lerp(inicio_y, 400, progresso_animacao);
                var modificador_arco = sin(progresso_animacao * pi) * altura_arco;
                
                x = atual_x;
                y = atual_y - modificador_arco;
                
                image_angle = lerp(rotacao_inicial + 360, rotacao_alvo, progresso_animacao);
			
                break;
                
            // ETAPA 2: A ameaça encontra a carta
            case 2:
				image_angle = rotacao_alvo;
                progresso_animacao += velocidade_animacao_ameaca;
                
                if (progresso_animacao >= 1) {
                    progresso_animacao = 1;
                    
                    etapa_coringa = 3;
                    progresso_animacao = 0;
                    
                    inicio_x = x;
                    inicio_y = y;
                    
                    if (instance_exists(meu_obj_ameaca)) {
                        meu_obj_ameaca.inicio_x = meu_obj_ameaca.x;
                        meu_obj_ameaca.inicio_y = meu_obj_ameaca.y;
                    }
                }
                
                x = 1000;
                y = 400;
                
                if (instance_exists(meu_obj_ameaca)) {
                    meu_obj_ameaca.x = lerp(meu_obj_ameaca.inicio_x, 1000, progresso_animacao);
                    meu_obj_ameaca.y = lerp(meu_obj_ameaca.inicio_y, 400, progresso_animacao);
                }
                break;
                

				// ETAPA 3: Carta e ameaça vão juntas até a condição
			case 3:

			    progresso_animacao += velocidade_animacao_ameaca;

			    if (progresso_animacao >= 1) {
			        progresso_animacao = 1;
			    }

			    var atual_x = lerp(inicio_x, destino_final_x, progresso_animacao);
			    var atual_y = lerp(inicio_y, destino_final_y, progresso_animacao);

			    var modificador_arco = sin(progresso_animacao * pi) * altura_arco;

			    x = atual_x;
			    y = atual_y - modificador_arco;

			    image_angle = rotacao_alvo;

			    if (instance_exists(meu_obj_ameaca)) {
			        meu_obj_ameaca.x = x;
			        meu_obj_ameaca.y = y;
			    }

			    // Só inicia a etapa 4 depois de concluir o movimento
			    if (progresso_animacao >= 1) {

			        // Guarda a posição REAL onde a ameaça terminou
			        if (instance_exists(meu_obj_ameaca)) {
			            meu_obj_ameaca.inicio_x = meu_obj_ameaca.x;
			            meu_obj_ameaca.inicio_y = meu_obj_ameaca.y;
			        }

			        etapa_coringa = 4;
			        progresso_animacao = 0;
			    }

			break;
                
            // ETAPA 4: A ameaça retorna sozinha

			case 4:

			    progresso_animacao += velocidade_animacao_ameaca;

			    if (progresso_animacao >= 1) {
			        progresso_animacao = 1;
			        animacao_ativa = false;
			    }

			    // Carta permanece no destino final
			    x = destino_final_x;
			    y = destino_final_y;

			    image_angle = rotacao_alvo;

			    if (instance_exists(meu_obj_ameaca)) {

			        meu_obj_ameaca.x = lerp(
			            meu_obj_ameaca.inicio_x,
			            meu_obj_ameaca.destino_retorno_x,
			            progresso_animacao
			        );

			        meu_obj_ameaca.y = lerp(
			            meu_obj_ameaca.inicio_y,
			            meu_obj_ameaca.destino_retorno_y,
			            progresso_animacao
			        );
			    }

			break;
        }
    }
    
    //=========================================
    // ANIMAÇÃO PADRÃO PARA A MESA
    //=========================================
    else if (estado_carta == "mesa") {
        
        progresso_animacao += velocidade_animacao;
        
        if (progresso_animacao >= 1) {
            progresso_animacao = 1;
            animacao_ativa = false;
        }
        
        // Mesmo destino utilizado pela animação de coringa
        var atual_x = lerp(inicio_x, destino_x, progresso_animacao);
        var atual_y = lerp(inicio_y, destino_y, progresso_animacao);
        
        var modificador_arco = sin(progresso_animacao * pi) * altura_arco;
        
        x = atual_x;
        y = atual_y - modificador_arco;
        
        image_angle = lerp(rotacao_inicial + 360, rotacao_alvo, progresso_animacao);
        
        var escala_juice = 1 + (sin(progresso_animacao * pi) * 0.15);
        image_xscale = escala_juice;
        image_yscale = escala_juice;
    }
    
    //=========================================
    // OUTRAS ANIMAÇÕES
    //=========================================
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



