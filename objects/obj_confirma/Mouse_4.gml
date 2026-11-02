
if visible == true
{
	// Confirma a primeira rodada
	with (obj_carta) {
	    if (estado_carta == "base" || estado_carta == "pre_escolha") 
		{
	        estado_carta = "mao";
	    }
	}
	with (obj_carta) {
	    if (estado_carta == "mulligan") 
		{
	        instance_destroy();
	    }
	}
	global.escolhidas = 0

	// Depois de confirmar, você pode reposicionar as cartas da mão
	scr_reposicionar_mao();
	alarm[0] = 40
	//scr_reposicionar_rodada();
}

