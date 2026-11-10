if (!animacao_finalizada)
{
    timer++;

    if (timer >= 2)
    {
        timer = 0;

        if (pontos_restantes > 0)
        {
            var convertido = min(velocidade, pontos_restantes);

            pontos_restantes -= convertido;

            pontuacao_final += convertido * multiplicador_final;
        }

        if (pontos_restantes <= 0)
        {
            animacao_finalizada = true;

            pontuacao_final =
                global.pontuacao_total *
                global.multiplicador_atual;
        }
    }
}


/*
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



