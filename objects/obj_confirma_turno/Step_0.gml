var qtd_pre_escolha = 0;
with (obj_carta) {
    if (estado_carta == "mesa")
	{
		var qtd_pre_escolha = 0;
        qtd_pre_escolha++;
    }
}

// Controla visibilidade do botão de confirmação
with (obj_confirma_turno) {
    if (qtd_pre_escolha == 1) {
        visible = true;
    } else {
        visible = false;
    }
}



/// TRANSIÇÃO DE DERROTA COM DELAY

if (derrota_pendente)
{
    timer_derrota++;

    // Aguarda a animação de erro
    if (timer_derrota >= 24)
    {
        derrota_pendente = false;
        room_goto(rm_final);
    }
}
