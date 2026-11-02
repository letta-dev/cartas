if (!animacao_finalizada)
{
    timer++;

    if (timer >= 2) // controla a velocidade da animação
    {
        timer = 0;

        if (pontos_restantes > 0)
        {
            pontos_restantes -= velocidade;

            if (pontos_restantes < 0)
                pontos_restantes = 0;

            pontuacao_final += velocidade * multiplicador_final;
        }

        // terminou a contagem?
        if (pontos_restantes <= 0)
        {
            animacao_finalizada = true;

            // garante que o valor final fique exato
            pontuacao_final =
                global.pontuacao_total *
                global.multiplicador_atual;
        }
    }
}



