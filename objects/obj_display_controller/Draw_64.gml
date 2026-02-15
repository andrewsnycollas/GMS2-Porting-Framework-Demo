if (global.debug_mode) {
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, 250, 120, false); // Fundo escuro pro texto
    draw_set_alpha(1);
    
    draw_set_color(c_lime);
    draw_set_halign(fa_left);
    draw_text(10, 10, "FPS (Real): " + string(fps_real)); // Performance real da CPU
    draw_text(10, 30, "Instances: " + string(instance_count));
    draw_text(10, 50, "Input Method: " + (global.input_current_method == INPUT_METHOD.GAMEPAD ? "GAMEPAD" : "KEYBOARD"));
    draw_text(10, 70, "Resolution: " + string(window_get_width()) + "x" + string(window_get_height()));
    draw_text(10, 90, "GUI Size: " + string(display_get_gui_width()) + "x" + string(display_get_gui_height()));
}