if (visible) 
{
	if global.coringa_ativo == false
{
	with obj_carta
	{
		if estado_carta == "mesa"
		{
			estado_carta = "mao";
			image_angle = 0;
		}}
    scr_reposicionar_mao();
	
	
	image_xscale = 0.8
	image_yscale = 0.8
	global.coringa_ativo = true
}
else
{
	with obj_carta
	{
		if estado_carta == "mesa"
		{
			estado_carta = "mao";
			image_angle = 0;
		}}
    scr_reposicionar_mao();
	
	
	image_xscale = 1
	image_yscale = 1
	global.coringa_ativo = false
}
}