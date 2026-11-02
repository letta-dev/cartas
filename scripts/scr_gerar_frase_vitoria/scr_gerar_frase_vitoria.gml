function scr_gerar_frase_vitoria(){
	

    var exclamacao;
    var tratamento;
    var elogio;
    var alfinetada;

    switch (global.idioma_select)
    {
        case 0: // Inglês
            var exclamacao = [	"Howdy!", 
								"Holy smoke!", 
								"By golly!", 
								"Blazin' saddles!", 
								"Bang bang!", 
								"Look at that!"];

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
            exclamacao = [	"Caramba!", 
							"Pelas barbas de um bisão!", 
							"Rapaz,", 
							"Arre égua!", 
							"Bang bang!", 
							"Olha só!"];

            tratamento = [	"cowboy",
			                "parceiro",
			                "forasteiro",
			                "pistoleiro",
			                "apostador",
			                "viajante"];

            elogio = [	"você joga muito!", 
						"que jogada magnífica!", 
						"sua intuição é afiada!", 
						"você tem nervos de aço!", 
						"essa foi certeira!"];

            alfinetada = [	"É um campeão nato.", 
							"O saloon inteiro está olhando.", 
							"Os xerifes teriam inveja.", 
							"Essa run vai entrar para a história.", 
							"A banca até tremeu."];
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