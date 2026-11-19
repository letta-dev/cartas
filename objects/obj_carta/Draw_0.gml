var borda = 10;



if estado_carta == "correto"
{
		// Cor vermelha
	draw_set_color(c_blue);

	// Desenha o retângulo atrás do objeto
	draw_rectangle(
	    bbox_left - borda,
	    bbox_top - borda,
	    bbox_right + borda,
	    bbox_bottom + borda,
	    false
	);

		// Desenha o sprite por cima
		draw_self();
}

if estado_carta == "incorreto"
{
		// Cor vermelha
	draw_set_color(c_red);

	// Desenha o retângulo atrás do objeto
	draw_rectangle(
	    bbox_left - borda,
	    bbox_top - borda,
	    bbox_right + borda,
	    bbox_bottom + borda,
	    false
	);

		// Desenha o sprite por cima
		draw_self();
}
		
	
draw_self();



