// Resolução base do jogo (Ex: Pixel Art Style)
base_w = 480;
base_h = 270;
width = base_w;
height = base_h;
scale = 3; // Começa 3x maior (1440x810)

// Configura janela inicial
window_set_size(base_w * scale, base_h * scale);
alarm[0] = 1; // Centraliza a janela no próximo frame
surface_resize(application_surface, base_w * scale, base_h * scale);

global.debug_mode = false;