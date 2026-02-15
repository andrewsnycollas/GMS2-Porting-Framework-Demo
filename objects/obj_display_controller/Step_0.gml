if (window_get_width() != width || window_get_height() != height) {
    width = window_get_width();
    height = window_get_height();
    
    // Redimensiona a surface da aplicação para caber na janela nova
    surface_resize(application_surface, width, height);
    display_set_gui_size(width, height);
}

if (keyboard_check_pressed(vk_f3)) {
    global.debug_mode = !global.debug_mode;
}