if (file_exists("savegame.json")) {
    // 1. Carregar o arquivo
    var _buffer = buffer_load("savegame.json");
    var _json_string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    
    // 2. Converter de volta para Struct
    var _load_data = json_parse(_json_string);
    
    // 3. Aplicar os dados
    if (instance_exists(obj_player)) {
        obj_player.x = _load_data.player_x;
        obj_player.y = _load_data.player_y;
        obj_player.facing_dir = _load_data.player_dir;
        
        // Atualiza o sprite imediatamente para não "piscar" errado
        obj_player.image_index = floor((_load_data.player_dir + 45) / 90) % 4;
    }
    
    show_debug_message("Game Loaded");
}