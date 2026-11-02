if visible == true
{

	scr_validar_expressao();

	// 1. Aplica as consequências baseadas no resultado
	if (resultado == true) 
	{

		scr_acerto();
		
	} 
	else 
	{

		scr_erro();
	}

	// 2. Gerenciamento de Turnos e Rodadas (Executa sempre, seja acerto ou erro)
	global.turno_atual++;
	global.turno_total ++;

	if (global.turno_atual <= global.turnos_por_rodada) 
	{
	    scr_reposicionar_rodada(); 
	    scr_reposicionar_mao();
	}
	else
	{
		scr_iniciar_jogo ();
		global.turno_atual = 1
		global.rodada_atual ++
		global.multiplicador_atual += global.incremento_multiplicador
	}

	// 3. Limpeza/Movimentação das cartas (Executa sempre)
	// NOTA: Se você mantiver o instance_destroy(), reposicionar o X e Y é desnecessário.
	with (obj_carta) 
	{
	    if (estado_carta == "historico") 
	    {
	        //scr_organizar_historico();
			instance_destroy(); 
	    }
	}
	
}