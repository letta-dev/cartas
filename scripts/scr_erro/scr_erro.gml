function scr_erro()
{
		global.multiplicador_atual = max(1, global.multiplicador_atual - global.incremento_multiplicador);
		//global.pontuacao_total -= global.pontos_por_acerto;
		var msg = scr_gerar_frase_derrota()
		global.texto = msg
		var pos_x = ((room_width/2)-320)
		instance_create_layer(pos_x,200,"Instances", obj_fala)
		show_debug_message(string(msg))
		show_debug_message("Idioma atual: " + global.idiomas[global.idioma_select]);
		show_debug_message("Idioma atual: " + string(global.idioma_select));
		room_goto(rm_final)
		global.acerto_consecutivo = 0

}