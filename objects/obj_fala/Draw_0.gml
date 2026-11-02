
// 1. Desenha o sprite do objeto (balão de texto, placa, etc.)
draw_self();

// 2. Define a fonte ativa ANTES de calcular as dimensões (Muito importante!)
// Substitua 'fnt_sua_fonte' pelo nome da fonte que você criou no GameMaker
draw_set_font(principal_p); 

// 3. Centraliza o texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black); 

// 4. Configurações da quebra automática
var espacamento_linhas = 25; // Distância em pixels entre uma linha e outra
var largura_maxima = 300;     // Largura máxima em pixels antes de quebrar a linha

// 5. Desenha a frase com quebra automática
draw_text_ext(x, y, global.texto, espacamento_linhas, largura_maxima);

// 6. Reseta o alinhamento para o padrão do motor
draw_set_halign(fa_left);
draw_set_valign(fa_top);
