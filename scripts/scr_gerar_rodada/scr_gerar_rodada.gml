//NOVO SORTEIO

function scr_gerar_rodada() {
    // 1. Limpa os arrays da rodada
    global.cartas_base = [];
    global.cartas_banca = [];
    global.condicoes = [];
    
    // Controle para garantir no máximo 1 repetição de valor nas cartas base
    var contagem_valores = array_create(global.valor_maximo - global.valor_minimo + 1, 0);
    var teve_repeticao = false;
    
    // --- GERAR CARTAS BASE DO JOGADOR (SISTEMA DE QUADRANTES) ---
    // Calcula dinamicamente o tamanho de cada bloco baseado nos turnos configurados
    var intervalo_total = global.valor_maximo - global.valor_minimo + 1;
    var tamanho_quadrante = intervalo_total / global.turnos_por_rodada;
    
    for (var i = 0; i < global.turnos_por_rodada; i++) {
        // Define as fronteiras mínimas e máximas do quadrante atual
        var quad_min = floor(global.valor_minimo + (i * tamanho_quadrante));
        var quad_max = floor(global.valor_minimo + ((i + 1) * tamanho_quadrante) - 1);
        
        // Garante que o último quadrante cubra perfeitamente até o valor máximo global
        if (i == global.turnos_por_rodada - 1) {
            quad_max = global.valor_maximo;
        }
        
        var carta_valida = false;
        var carta_sorteada = 0;
        var tentativas = 0; // Evita loop infinito se o quadrante estiver saturado
        
        while (!carta_valida && tentativas < 50) {
            tentativas++;
            carta_sorteada = irandom_range(quad_min, quad_max);
            var idx = carta_sorteada - global.valor_minimo;
            
            // Validação de repetição padrão do seu código original
            if (contagem_valores[idx] == 0) {
                carta_valida = true;
            } else if (contagem_valores[idx] == 1 && !teve_repeticao) {
                carta_valida = true;
                teve_repeticao = true;
            }
        }
        
        // Fail-safe: Se o quadrante saturar por azar matemático, sorteia no escopo geral
        if (!carta_valida) {
            carta_sorteada = irandom_range(global.valor_minimo, global.valor_maximo);
        }
        
        // Registra e empurra para as cartas base
        contagem_valores[carta_sorteada - global.valor_minimo]++;
        array_push(global.cartas_base, carta_sorteada);
        
        // --- GERAR TURNOS DA BANCA E CONDIÇÕES ---
        // Sorteio da Banca respeitando rigorosamente o achatamento pelo limite estipulado
        var banca_min = global.valor_minimo + global.limite;
        var banca_max = global.valor_maximo - global.limite;
        var banca_sorteada = irandom_range(banca_min, banca_max);
        array_push(global.cartas_banca, banca_sorteada);
        
        // Sorteio da Condição avulsa e puramente independente (Apenas maior ou menor)
        var opcoes = ["maior", "menor"];
        var condicao_sorteada = opcoes[irandom(1)]; // Sorteia index 0 ou 1
        array_push(global.condicoes, condicao_sorteada);
    }
}
/*

function scr_gerar_rodada() {
    // 1. Limpa os arrays da rodada
    global.cartas_base = [];
    global.cartas_banca = [];
    global.condicoes = [];
    
    // Controle para garantir no máximo 1 repetição de valor nas cartas base
    var contagem_valores = array_create(global.valor_maximo - global.valor_minimo + 1, 0);
    var teve_repeticao = false;
    
    // 2. Geração dos turnos (Cartas Base, Banca e Condição)
    for (var i = 0; i < global.turnos_por_rodada; i++) {
        
        // --- Sorteio da Carta Base ---
        var carta_valida = false;
        var carta_sorteada = 0;
        
        while (!carta_valida) {
            carta_sorteada = irandom_range(global.valor_minimo, global.valor_maximo);
            var idx = carta_sorteada - global.valor_minimo;
            
            // Verifica se o valor já foi sorteado
            if (contagem_valores[idx] == 0) {
                carta_valida = true;
            } else if (contagem_valores[idx] == 1 && !teve_repeticao) {
                // Permite apenas uma repetição na rodada inteira
                carta_valida = true;
                teve_repeticao = true;
            }
        }
        
        // Registra a carta base sorteada
        contagem_valores[carta_sorteada - global.valor_minimo]++;
        array_push(global.cartas_base, carta_sorteada);
        
        // --- Sorteio do Alvo da Banca ---
        var banca_sorteada = irandom_range(global.valor_minimo, global.valor_maximo);
        array_push(global.cartas_banca, banca_sorteada);
        
        // --- Comparação e Atribuição da Condição ---
        if (carta_sorteada > banca_sorteada) {
            array_push(global.condicoes, "maior");
        } else if (carta_sorteada < banca_sorteada) {
            array_push(global.condicoes, "menor");
        } else {
            array_push(global.condicoes, "igual");
        }
    }
}
