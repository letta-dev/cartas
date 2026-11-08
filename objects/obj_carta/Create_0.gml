//novo creat event obj_carta

if (!variable_instance_exists(id, "valor")) valor = 0;
if (!variable_instance_exists(id, "estado_carta")) estado_carta = 0;

//tipo_condicao

//***** ANIMAÇÃO *****\
destino_x = x;
destino_y = y;

animacao_ativa = false;
atraso_animacao = 0;

//***** JUICE & PARÁBOLA (Novas Variáveis) *****\
inicio_x = x;
inicio_y = y;
progresso_animacao = 0;       // Vai de 0 (mão) até 1 (mesa)
velocidade_animacao = 0.04;   // Controla a velocidade do voo (ajuste se achar lento/rápido)
velocidade_animacao_ameaca = 0.02
altura_arco = 100;            // Altura do "pulo" da carta em pixels
rotacao_inicial = 0;          // Ângulo de onde o giro começa
rotacao_alvo = 0;             // Ângulo levemente torto onde ela vai parar na mesa





