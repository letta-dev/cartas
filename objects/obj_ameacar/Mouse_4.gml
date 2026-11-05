if (visible) 
{
	if global.coringa_ativo == false
{
	image_xscale = 0.8
	image_yscale = 0.8
	global.coringa_ativo = true
}
else
{
	image_xscale = 1
	image_yscale = 1
	global.coringa_ativo = false
}
}