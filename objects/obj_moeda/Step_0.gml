if (room == rm_game)
{
	var posicao_y = y
	if ( posicao_y >= 288) instance_destroy()
}

if (room == rm_final)
{
	var posicao_y = y
	var limite_y = ((room_height/2)-180)
	if ( posicao_y >= limite_y) instance_destroy()
}

if (room == rm_inicio)
{
	if (y >= room_height)
	{
		randomise()
		y=-30
		x += (random_range(-100,100))
	}
}