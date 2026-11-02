function scr_gerar_frase_derrota()
{
    var exclamacao;
    var tratamento;
    var elogio;
    var alfinetada;

    switch (global.idioma_select)
    {
        case 0: // Inglês
            exclamacao = [	"Ouch!", 
							"Busted!", 
							"Dead end,", 
							"Drats!", 
							"Bang!", 
							"Missed by a mile!"];

            tratamento = [	"stranger", 
							"cowboy", 
							"partner", 
							"gunslinger", 
							"pal", 
							"outlaw"];

            elogio = [	"your luck dried up like the desert!", 
						"the dealer took your boots!", 
						"your intuition completely failed!", 
						"that shot backfired!", 
						"the whole saloon laughed at that!"];

            alfinetada = [	"Dust yourself off and try again.", 
							"The vultures are already circling.", 
							"The sheriff is laughing at you.", 
							"Back to the end of the line.", 
							"Time to pay for the drinks."];
            break;

        case 1: // Português
            exclamacao = [	"Eita!", 
							"Misericórdia!", 
							"Caiu do cavalo!", 
							"Fim da linha,", 
							"Bang!", 
							"Passou longe!"];

            tratamento = [	"forasteiro", 
							"cowboy", 
							"parceiro", 
							"pistoleiro", 
							"amigo", 
							"foragido"];

            elogio = [	"sua sorte secou que nem o deserto!", 
						"a banca levou até suas botas!", 
						"sua intuição falhou feio!", 
						"esse tiro saiu pela culatra!", 
						"o saloon inteiro riu dessa!"];

            alfinetada = [	"Melhor limpar a poeira e tentar de novo.", 
							"Os urubus já estão rondando.", 
							"O xerife está rindo de você.", 
							"De volta para o final da fila.", 
							"Hora de pagar as bebidas."];
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