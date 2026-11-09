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
}

		

