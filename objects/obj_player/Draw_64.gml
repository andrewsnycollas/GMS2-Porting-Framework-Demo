// Pega o tamanho atual da camada de GUI
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Define a cor branca pra não tingir o sprite
draw_set_color(c_white);

// Desenha o sprite ESTICADO para cobrir a tela inteira (0,0 até _gui_w,_gui_h)
if (global.input_current_method == INPUT_METHOD.KEYBOARD) {
    draw_sprite_stretched(spr_keyboard, ii, 0, 0, _gui_w, _gui_h);
   
} 
else {
    draw_sprite_stretched(spr_gamepad, ii, 0, 0, _gui_w, _gui_h);
}

// --- ÍCONE DE SALVAMENTO ---
if (global.is_saving > 0) {
    // Mantive a lógica original, mas garanti alinhamento seguro
    var _icon_x = _gui_w - 50;
    var _icon_y = 50;
    
	draw_set_alpha(((-60+global.is_saving)/60)*1.5)
    draw_sprite(spr_saving_icon, jj, _icon_x+8, _icon_y);
    
    draw_set_halign(fa_right); // Alinha texto à direita pra não cortar
    draw_text(_icon_x, _icon_y, "SAVING DO NOT TURN OFF");
    draw_set_halign(fa_left);  // Reseta alinhamento
	draw_set_alpha(1)
}