
// GERAÇÃO DAS MOEDAS

if (moedas_criadas < moedas_para_criar)
{
    repeat(moedas_por_frame)
    {
        if (moedas_criadas >= moedas_para_criar)
            break;

        var pos_x = random_range(300, 900);
        var pos_y = -random(2000);

        instance_create_layer(
            pos_x,
            pos_y,
            "Instances",
            obj_moeda
        );

        moedas_criadas++;
    }
}


if (!animacao_finalizada)
{
    timer++;

    if (timer >= 2)
    {
        timer = 0;

        if (pontos_restantes > 0)
        {
            var convertido =
                min(velocidade, pontos_restantes);

            pontos_restantes -= convertido;

            pontuacao_final +=
                convertido * multiplicador_final;
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
// ---------------------------
// CRIAÇÃO DAS MOEDAS
// ---------------------------

if (moedas_criadas < moedas_para_criar)
{
    timer_moedas += 1;

    if (timer_moedas >= intervalo_moedas)
    {
        timer_moedas = 0;

        var pos_x = random_range(300, 900);
        var pos_y = -random_range(100, 2000);

        instance_create_layer(
            pos_x,
            pos_y,
            "Instances",
            obj_moeda
        );

        moedas_criadas++;
    }
}

// ---------------------------
// ANIMAÇÃO DO CASH OUT
// ---------------------------

if (!animacao_finalizada)
{
    timer++;

    if (timer >= 2)
    {
        timer = 0;

        if (pontos_restantes > 0)
        {
            var convertido =
                min(velocidade, pontos_restantes);

            pontos_restantes -= convertido;

            pontuacao_final +=
                convertido * multiplicador_final;
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