if (room == rm_game) 
{
	scr_iniciar_jogo ();
	global.turno_atual = 1
	global.rodada_atual ++
}


if (room == rm_final)
{
			for (var i = 0; i < global.pontuacao_total; i++)
			{
				    var pos_x = random_range(300,900);
				    var pos_y = -random(2000); // espalha 2000 pixels acima da tela

				    instance_create_layer(pos_x, pos_y, "Instances", obj_moeda);
				//var_posx = (room_width)
			    //var moeda = instance_create_layer(1 + random_range(0, var_posx), -5 - random(100),"Instances",obj_moeda);
			}
}


if (room == rm_inicio)
{
	for (var i = 0; i < 100; i++)
{
    var pos_x = random(room_width);
    var pos_y = -random(1000); // espalha 2000 pixels acima da tela

    instance_create_layer(pos_x, pos_y, "Instances", obj_moeda);
}
}