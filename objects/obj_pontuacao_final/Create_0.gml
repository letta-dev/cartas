pontos_restantes = global.pontuacao_total;
multiplicador_final = global.multiplicador_atual;

pontuacao_final = 0;

timer = 0;
animacao_finalizada = false;

// duração desejada da animação (em segundos)
var duracao_animacao = 3;

// fps da room
var _fps = room_speed;

// como você converte a cada 2 frames:
var atualizacoes = (duracao_animacao * _fps) div 2;

// velocidade calculada automaticamente
velocidade = max(1, ceil(global.pontuacao_total / atualizacoes));

// Frase final
if (global.multiplicador_atual > 2)
{
    frase_resultado = scr_gerar_frase_vitoria();
}
else
{
    frase_resultado = scr_gerar_frase_derrota();
}


/*
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