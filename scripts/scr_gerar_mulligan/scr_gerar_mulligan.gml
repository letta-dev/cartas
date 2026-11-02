function scr_gerar_mulligan() {
    global.opcoes_mulligan = [];
    global.cartas_extras = [];

    var repeticoes_com_base = 0;

    // Mesmo cálculo de quadrantes usado na rodada
    var quantidade_opcoes = 4;
    var intervalo_total = global.valor_maximo - global.valor_minimo + 1;
    var tamanho_quadrante = intervalo_total / quantidade_opcoes;

    for (var q = 0; q < quantidade_opcoes; q++) {

        var quad_min = floor(global.valor_minimo + (q * tamanho_quadrante));
        var quad_max = floor(global.valor_minimo + ((q + 1) * tamanho_quadrante) - 1);

        if (q == quantidade_opcoes - 1) {
            quad_max = global.valor_maximo;
        }

        var carta_valida = false;
        var candidato = 0;
        var tentativas = 0;

        while (!carta_valida && tentativas < 50) {

            tentativas++;

            candidato = irandom_range(quad_min, quad_max);

            // Não repetir dentro do mulligan
            var ja_existe_no_mulligan = false;

            for (var i = 0; i < array_length(global.opcoes_mulligan); i++) {
                if (global.opcoes_mulligan[i] == candidato) {
                    ja_existe_no_mulligan = true;
                    break;
                }
            }

            if (ja_existe_no_mulligan) {
                continue;
            }

            // Verifica se existe nas cartas base
            var existe_na_base = false;

            for (var j = 0; j < array_length(global.cartas_base); j++) {
                if (global.cartas_base[j] == candidato) {
                    existe_na_base = true;
                    break;
                }
            }

            // Regra: máximo 1 repetição com a base
            if (existe_na_base) {
                if (repeticoes_com_base < 1) {
                    carta_valida = true;
                    repeticoes_com_base++;
                }
            } else {
                carta_valida = true;
            }
        }

        // Fail-safe
        if (!carta_valida) {

            var encontrado = false;
            var tentativas_globais = 0;

            while (!encontrado && tentativas_globais < 100) {

                tentativas_globais++;

                candidato = irandom_range(
                    global.valor_minimo,
                    global.valor_maximo
                );

                var invalida = false;

                // Não repetir mulligan
                for (var i = 0; i < array_length(global.opcoes_mulligan); i++) {
                    if (global.opcoes_mulligan[i] == candidato) {
                        invalida = true;
                        break;
                    }
                }

                if (invalida) continue;

                // Verifica base
                var existe_na_base = false;

                for (var j = 0; j < array_length(global.cartas_base); j++) {
                    if (global.cartas_base[j] == candidato) {
                        existe_na_base = true;
                        break;
                    }
                }

                if (existe_na_base && repeticoes_com_base >= 1) {
                    continue;
                }

                if (existe_na_base) {
                    repeticoes_com_base++;
                }

                encontrado = true;
            }
        }

        array_push(global.opcoes_mulligan, candidato);
    }
}


/*function scr_gerar_mulligan() {
    global.opcoes_mulligan = [];
    global.cartas_extras = [];
    
    var repeticoes_com_base = 0; // Contador de repetições com cartas_base
    
    while (array_length(global.opcoes_mulligan) < 4) {
        var candidato = irandom_range(global.valor_minimo, global.valor_maximo);
        
        // 1. Verifica se a carta já existe dentro das próprias opções de mulligan (Sem repetição entre si)
        var ja_existe_no_mulligan = false;
        for (var i = 0; i < array_length(global.opcoes_mulligan); i++) {
            if (global.opcoes_mulligan[i] == candidato) {
                ja_existe_no_mulligan = true;
                break;
            }
        }
        
        if (ja_existe_no_mulligan) {
            continue; // Tenta outro número se já estiver nas opções
        }
        
        // 2. Verifica se o candidato é repetido em relação às cartas base
        var existe_na_base = false;
        for (var j = 0; j < array_length(global.cartas_base); j++) {
            if (global.cartas_base[j] == candidato) {
                existe_na_base = true;
                break;
            }
        }
        
        // 3. Valida a regra: máximo de 1 repetição acumulada com a base
        if (existe_na_base) {
            if (repeticoes_com_base < 1) {
                array_push(global.opcoes_mulligan, candidato);
                repeticoes_com_base++;
            }
        } else {
            array_push(global.opcoes_mulligan, candidato);
        }
    }
}
