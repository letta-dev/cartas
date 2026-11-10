
function scr_acerto()
{
    // 1. Calcula a pontuação da jogada
    var pontos_base = global.pontos_por_acerto;

    var bonus_dupla = global.bonus_jogada_dupla_pontos;
    var bonus_jackpot = global.bonus_jackpot_pontos;

    var pontos_ganhos =
        pontos_base + bonus_dupla + bonus_jackpot;

    // 2. Cria as moedas da animação original
    for (var i = 0; i < global.pontos_por_acerto; i++)
    {
        var moeda = instance_create_layer(
            1120 + random_range(-50, 50),
            -5 - random(30),
            "Instances",
            obj_moeda
        );
    }

    // 3. Adiciona todos os pontos à pontuação total
    global.pontuacao_total += pontos_ganhos;

    // 4. Mensagem de vitória
    var msg = scr_gerar_frase_vitoria();

    global.texto = msg;

    var pos_x = ((room_width / 2) - 320);

    instance_create_layer(
        pos_x,
        400,
        "Instances",
        obj_fala
    );

    show_debug_message(string(msg));

    show_debug_message(
        "Idioma atual: " +
        global.idiomas[global.idioma_select]
    );

    show_debug_message(
        "Idioma atual: " +
        string(global.idioma_select)
    );

    // 5. Contabiliza acertos consecutivos
    if (global.usou_coringa == false)
    {
        global.acerto_consecutivo++;
    }

    // 6. Exibe informações de pontuação no console
    show_debug_message("Pontos base: " + string(pontos_base));
    show_debug_message("Bonus dupla: " + string(bonus_dupla));
    show_debug_message("Bonus jackpot: " + string(bonus_jackpot));
    show_debug_message("Total ganho: " + string(pontos_ganhos));

    // 7. Reseta os bônus para evitar reutilização
    global.bonus_jogada_dupla_pontos = 0;
    global.bonus_jackpot_pontos = 0;
}



/*
function scr_acerto()
{
		for (var i = 0; i < global.pontos_por_acerto; i++)
			{
			    var moeda = instance_create_layer(
			        1120 + random_range(-50, 50),
			        -5 - random(30),
			        "Instances",
			        obj_moeda
			    );
			}
		//instance_create_layer(1120,-5,"Instances",obj_moeda);
		global.pontuacao_total += global.pontos_por_acerto;
	    //global.multiplicador_atual += global.incremento_multiplicador;
		var msg = scr_gerar_frase_vitoria()
		global.texto = msg
		var pos_x = ((room_width/2)-320)
		instance_create_layer(pos_x,400,"Instances", obj_fala)
		show_debug_message(string(msg))
		show_debug_message("Idioma atual: " + global.idiomas[global.idioma_select]);
		show_debug_message("Idioma atual: " + string(global.idioma_select));
		if (global.usou_coringa == false) global.acerto_consecutivo ++
		/*if (global.acerto_consecutivo == global.coringa)
		{
			instance_create_layer(1000, 600, "Instances", obj_carta, {
			    valor: 24,
			    estado_carta: "coringa",
			    animacao_ativa: true
			});
		}*/

		

