// Conta quantas cartas estão em pre_escolha
var qtd_pre_escolha = 0;
with (obj_carta) {
    if (estado_carta == "pre_escolha") {
        qtd_pre_escolha++;
    }
}

// Controla visibilidade do botão de confirmação
with (obj_confirma) {
    if (qtd_pre_escolha == global.qtd_cartas_extras) {
        visible = true;
    } else {
        visible = false;
    }
}
