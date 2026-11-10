/// Evento Create do obj_controle

// ==========================================
// PAINEL DE CONTROLE / BALANCEAMENTO
// (Altere estes valores para testar o jogo)
// ==========================================

// Estrutura da Partida
global.total_rodadas = 5;             // 3 para partida curta, 8 para partida longa
global.turnos_por_rodada = 3;         // Quantidade de turnos por rodada
global.turno_total = 0
// Intervalo numérico dos alvos e cartas
global.valor_minimo = 1;              // Menor número possível
global.valor_maximo = 20;             // Maior número possível

// Regras da Mão
global.qtd_cartas_base = 3;           // Cartas geradas para resolver a rodada
global.qtd_cartas_extras = 1;         // Cartas adicionais escolhidas pelo jogador
global.escolhidas = 0;
global.limite_mesa = 2;
global.limite = 3;

// Pontuação e Multiplicadores (Modelo B)
global.pontos_por_acerto = 5;         // Pontos base concedidos por acerto em um turno
global.multiplicador_inicial = 1.0;   // Multiplicador com o qual o jogo começa
global.incremento_multiplicador = 0.25; // Quanto o multiplicador sobe por rodada perfeita (ex: 1.0 -> 1.5 -> 2.0)

// Limites do Escudo
global.max_escudos = 1;               // Limite máximo de escudos acumulados

// ==========================================
// ESTADO ATUAL DA PARTIDA (Dinâmico)
// ==========================================

global.rodada_atual =0;              // Rodada em andamento
global.turno_atual = 1;               // Turno em andamento dentro da rodada

global.pontuacao_total = 00;          // Pontuação acumulada
global.multiplicador_atual = global.multiplicador_inicial; // Multiplicador ativo

global.tem_escudo = false;           // Se o jogador possui escudo ativo no momento

// Controle de Fase da Rodada (Estados de Jogo)
// Estados possíveis sugeridos: "MONTANDO_MAO", "JOGANDO_TURNO", "FIM_RODADA", "FIM_JOGO"
global.estado_jogo = "MONTANDO_MAO";

global.carta_clicada_neste_frame = false;

//***** IDIOMA *****\\
global.idiomas = ["INGLES","PORTUGUES"] ;
global.idioma_select = 1
global.texto = noone




// Arrays da Rodada Atual
global.cartas_base = [];      // Array com as 5 cartas base da solução
global.cartas_banca = [];     // Array com os 5 alvos numéricos da banca
global.condicoes = [];        // Array com as 5 condições ("maior", "menor", "igual")
global.cartas_mao = [];

// Arrays do Mulligan
global.opcoes_mulligan = [];
global.cartas_extras = [];



moedas_restantes = global.pontuacao_total;

//****** CORINGA ******\\
global.acerto_consecutivo = 0;
global.coringa = 6;
global.usou_coringa = false;
global.coringa_ativo = false;


//****** JOGADA DUPLA ******\\

global.rodada_dupla_ativa = false;

global.cartas_disponiveis = 0;