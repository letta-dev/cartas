if visible == true
{

	obj_ameacar.image_xscale= 1
	obj_ameacar.image_yscale= 1
	var resultado = scr_validar_expressao();

	alarm[0] = room_speed * 1.5;
	
	
	
	
	if resultado
	{
		with (obj_carta)
	    {
	       if (
	            //estado_carta == "rodada_banca" ||
	            //estado_carta == "rodada_condicao" ||
	            estado_carta == "mesa"
	        )
	        {
	            estado_carta = "correto";
	        }
	    }
	}
	else
	{
		with (obj_carta)
		    {
		       if (
		            //estado_carta == "rodada_banca" ||
		            //estado_carta == "rodada_condicao" ||
		            estado_carta == "mesa"
		        )
		        {
		            estado_carta = "incorreto";
		        }
		    }
	}	
}