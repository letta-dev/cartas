pontos_restantes = global.pontuacao_total;

multiplicador_final = global.multiplicador_atual;

pontuacao_final = 0;

timer = 0;
velocidade = 1; // quantos pontos converte por passo

animacao_finalizada = false;

// Gera a frase
if (global.multiplicador_atual > 2)
{
    frase_resultado = scr_gerar_frase_vitoria();
}
else
{
    frase_resultado = scr_gerar_frase_derrota();
}