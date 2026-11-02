//***** ANIMAÇÃO *****\\



function scr_reposicionar_mulligan() {
    var lista = [];

    with (obj_carta) {
        if (estado_carta == "mulligan") {
            array_push(lista, id);
        }
    }

    array_sort(lista, function(a, b) {
        return a.valor - b.valor;
    });

    var centro_x = ((room_width / 2)-320);
    var centro_y = ((room_height / 2)-180);
    var espacamento_x = 90;
    var y_mulligan = centro_y - 180;
    var total = array_length(lista);

    for (var i = 0; i < total; i++) {
        var inst = lista[i];

        inst.destino_x = centro_x
            + (i - (total - 1) / 2) * espacamento_x;
        inst.destino_y = y_mulligan;

        inst.animacao_ativa = true;
        inst.atraso_animacao = i * 8;
    }
}