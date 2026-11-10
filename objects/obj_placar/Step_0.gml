pontos_exibidos = lerp(
    pontos_exibidos,
    global.pontuacao_total,
    0.1
);

if (abs(global.pontuacao_total - pontos_exibidos) < 1)
{
    pontos_exibidos = global.pontuacao_total;
}


multiplicador_exibidos = lerp(
    multiplicador_exibidos,
    global.multiplicador_atual,
    0.1
);

if (abs(global.multiplicador_atual - multiplicador_exibidos) < 0.01)
{
    multiplicador_exibidos = global.multiplicador_atual;
}




