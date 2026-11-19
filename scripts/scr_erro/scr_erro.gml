


function scr_erro()
{
    global.multiplicador_atual = max(1, global.multiplicador_atual - global.incremento_multiplicador);
    global.pontuacao_total -= global.pontos_por_acerto;

    // Ativa feedback visual de erro nas cartas da mesa
    with (obj_carta)
    {
        if (estado_carta == "mesa")
        {
            erro_anim_ativa = true;
            erro_anim_timer = 0;
        }
    }

    // Adia a troca de room para permitir a animação
    with (obj_confirma_turno)
    {
        derrota_pendente = true;
        timer_derrota = 0;
    }

    global.acerto_consecutivo = 0;
}



/*
function scr_erro()
{
		global.multiplicador_atual = max(1, global.multiplicador_atual - global.incremento_multiplicador);
		global.pontuacao_total -= global.pontos_por_acerto;
		

		// Ativa feedback visual de erro nas cartas da mesa
		with (obj_carta)
		{
		    if (estado_carta == "mesa")
		    {
		        erro_anim_ativa = true;
		        erro_anim_timer = 0;
		    }
		}
		
		
		
		
		room_goto(rm_final)
		global.acerto_consecutivo = 0

}