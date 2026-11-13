
draw_set_colour(c_black);
draw_set_font(principal_g);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var cx = ((room_width * 0.5) - 320);
var cy = ((room_height * 0.5) - 180);

// Título
draw_text(cx, cy - 120, "CASH OUT");

// Contagem
draw_text(
    cx,
    cy - 40,
    string(pontos_restantes)
    + " x "
    + string_format(multiplicador_final, 0, 2)
);

// Total
draw_text(
    cx,
    cy + 20,
    "= " + string(floor(pontuacao_final))
);

// Frase final
if (animacao_finalizada)
{
    draw_self();

    draw_text_ext(
        cx,
        cy + 100,
        frase_resultado,
        32,
        room_width * 0.7
    );
}


/*
draw_set_colour(c_black);
draw_set_font(principal_g);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var cx = ((room_width * 0.5)-320);
var cy = ((room_height * 0.5)-180);

// Título
draw_text(cx, cy - 120, "CASH OUT");

// Contagem
draw_text(
    cx,
    cy - 40,
    string(pontos_restantes) + " x " +
    string_format(multiplicador_final, 0, 2)
);

// Total
draw_text(
    cx,
    cy + 20,
    "= " + string(floor(pontuacao_final))
);

// Mostra a frase somente após o término
if (animacao_finalizada)
{
	draw_self()
    draw_text_ext(
        cx,
        cy + 100,
        frase_resultado,
        32,
        room_width * 0.7
    );
}


