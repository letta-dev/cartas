draw_self();
draw_set_colour(c_black);
draw_set_font(principal_g);
//draw_text(x,y, string(global.idiomas[global.idioma_select]));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//var texto = noone
//texto = global.pontuacao_total

//draw_text(x, y - 30, "CASH OUT");
//draw_text(x, y,texto);
//draw_text(x, y+15, string(/*floor*/(multiplicador_exibidos)));
draw_text(x, y - 30, string(floor(pontos_exibidos)));

draw_text(x,y + 30, string(multiplicador_exibidos));

// Volta ao padrão para não afetar outros textos
draw_set_halign(fa_left);
draw_set_valign(fa_top);
