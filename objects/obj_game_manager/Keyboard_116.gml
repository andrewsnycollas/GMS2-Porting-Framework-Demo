// 1. Criar a Struct com os dados
var _save_data = {
    player_x : obj_player.x,
    player_y : obj_player.y,
    player_dir : obj_player.facing_dir,
    room_name : room_get_name(room)
};

// 2. Converter para String JSON
var _json_string = json_stringify(_save_data);

// 3. Salvar no arquivo
var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _json_string);
buffer_save(_buffer, "savegame.json");
buffer_delete(_buffer);

show_debug_message("Game Saved: " + _json_string);
global.is_saving = 120