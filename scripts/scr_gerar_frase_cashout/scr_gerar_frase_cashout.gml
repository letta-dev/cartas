function scr_gerar_frase_cashout()
{
    var exclamacao;
    var tratamento;
    var elogio;
    var alfinetada;

    switch (global.idioma_select)
    {
        case 0: // Inglês
            exclamacao = [
                "Look at you:",
                "Well done:",
                "Wise move:",
                "Well well:",
                "Fair enough:",
                "Smart choice:"
            ];

            tratamento = [
                "cowboy",
                "partner",
                "stranger",
                "gunslinger",
                "gambler",
                "drifter"
            ];

            elogio = [
                "you leave with pockets full,",
                "secured your reward,",
                "took the dealer's gold,",
                "knew when to fold your cards,",
                "saved your multiplier,"
            ];

            alfinetada = [
                "but you lacked the guts to keep riding.",
                "even though your knees were shaking.",
                "but the saloon expected more bravery.",
                "run away, the yellowbelly is leaving!",
                "but the desert doesn't favor those who quit early."
            ];
            break;

        case 1: // Português
            exclamacao = [
                "Olha só:",
                "Muito bem:",
                "Sábio:",
                "Ora ora:",
                "Pois é:",
                "Justo:"
            ];

            tratamento = [
                "cowboy",
                "parceiro",
                "forasteiro",
                "gatilheiro",
                "apostador",
                "viajante"
            ];

            elogio = [
                "você sai com os bolsos cheios,",
                "garantiu a sua recompensa,",
                "levou o ouro da banca,",
                "soube a hora de parar,",
                "salvou o seu multiplicador,"
            ];

            alfinetada = [
                "mas faltou coragem para continuar.",
                "embora suas pernas tenham tremido.",
                "mas o saloon esperava mais bravura.",
                "fujam que o frouxo está batendo em retirada!",
                "mas o deserto não perdoa quem desiste cedo."
            ];
            break;

        case 2: // Espanhol
            // Adicionar futuramente
            break;

        default: // Idioma não encontrado
            exclamacao = ["Well done:"];
            tratamento = ["partner"];
            elogio = ["secured your reward,"];
            alfinetada = ["but there was more on the table."];
            break;
    }

    var esc = exclamacao[irandom(array_length(exclamacao) - 1)];
    var tra = tratamento[irandom(array_length(tratamento) - 1)];
    var elo = elogio[irandom(array_length(elogio) - 1)];
    var alf = alfinetada[irandom(array_length(alfinetada) - 1)];

    return esc + " " + tra + ", " + elo + " " + alf;
}