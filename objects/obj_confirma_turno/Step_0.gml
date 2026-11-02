var qtd_pre_escolha = 0;
with (obj_carta) {
    if (estado_carta == "mesa")
	{
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