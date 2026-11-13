
// CASH OUT

pontos_restantes = global.pontuacao_total;
multiplicador_final = global.multiplicador_atual;

pontuacao_final = 0;
timer = 0;
animacao_finalizada = false;

// duração da animação
duracao_animacao = 3;

atualizacoes = (room_speed * duracao_animacao) div 2;

velocidade = max(
    1,
    ceil(global.pontuacao_total / atualizacoes)
);


// MOEDAS

moedas_para_criar = global.pontuacao_total;

// quantidade gerada por frame
moedas_por_frame = max(
    1,
    ceil(moedas_para_criar / (room_speed * duracao_animacao))
);

moedas_criadas = 0;


// FRASE

if (global.multiplicador_atual > 2)
{
    frase_resultado = scr_gerar_frase_vitoria();
}
else
{
    frase_resultado = scr_gerar_frase_derrota();
}


/*
// ---------------------------
// CASH OUT
// ---------------------------

pontos_restantes = global.pontuacao_total;
multiplicador_final = global.multiplicador_atual;
pontuacao_final = 0;

timer = 0;
animacao_finalizada = false;

// duração da animação em segundos
duracao_animacao = 3;

// quantidade de atualizações
atualizacoes = (room_speed * duracao_animacao) div 2;

// velocidade automática
velocidade = max(
    1,
    ceil(global.pontuacao_total / atualizacoes)
);

// ---------------------------
// MOEDAS
// ---------------------------

// limita a quantidade visual
moedas_para_criar = min(
    max(20, global.pontuacao_total div 5),
    150
);

moedas_criadas = 0;

// cria moedas ao longo da animação
intervalo_moedas = atualizacoes / moedas_para_criar;
timer_moedas = 0;

// ---------------------------
// FRASE FINAL
// ---------------------------

if (global.multiplicador_atual > 2)
{
    frase_resultado = scr_gerar_frase_vitoria();
}
else
{
    frase_resultado = scr_gerar_frase_derrota();
}
