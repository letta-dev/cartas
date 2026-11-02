// Avança para o próximo idioma
global.idioma_select = global.idioma_select + 1;

// O operador % (mod) garante que se passar do limite, volta para 0 automaticamente
global.idioma_select = global.idioma_select % array_length(global.idiomas);

// (Opcional) Mostra no console o idioma que foi selecionado para testar
show_debug_message("Idioma atual: " + global.idiomas[global.idioma_select]);
show_debug_message("Idioma atual: " + string(global.idioma_select));