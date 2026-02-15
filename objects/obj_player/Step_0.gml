// 1. Atualizar qual input está sendo usado
check_input_source();

// 2. Zerar inputs temporários
var _left = 0, _right = 0, _up = 0, _down = 0, _shoot = 0;

// 3. Ler Inputs baseados nas Macros
if (global.input_current_method == INPUT_METHOD.KEYBOARD) {
    _up     = keyboard_check(K_UP);
    _down   = keyboard_check(K_DOWN);
    _left   = keyboard_check(K_LEFT);
    _right  = keyboard_check(K_RIGHT);
    _shoot  = keyboard_check_pressed(K_SHOOT);
} 
else { // GAMEPAD
    _up     = gamepad_button_check(GP_ID, G_UP) || (gamepad_axis_value(GP_ID, gp_axislv) < -G_DEADZONE);
    _down   = gamepad_button_check(GP_ID, G_DOWN) || (gamepad_axis_value(GP_ID, gp_axislv) > G_DEADZONE);
    _left   = gamepad_button_check(GP_ID, G_LEFT) || (gamepad_axis_value(GP_ID, gp_axislh) < -G_DEADZONE);
    _right  = gamepad_button_check(GP_ID, G_RIGHT) || (gamepad_axis_value(GP_ID, gp_axislh) > G_DEADZONE);
    _shoot  = gamepad_button_check_pressed(GP_ID, G_SHOOT);
}

// 4. Calcular Movimento
h_move = (_right - _left) * spd;
v_move = (_down - _up) * spd;

// Aplicar Movimento
x += h_move;
y += v_move;

// 5. Atualizar "Última Direção" (Para atirar parado)
if (h_move != 0 || v_move != 0) {
    facing_dir = point_direction(0, 0, h_move, v_move);
    // Aqui você também mudaria o sprite de andar:
    // sprite_index = spr_player_walk;
} else {
    // sprite_index = spr_player_idle;
}

// 6. Sistema de Tiro
if (_shoot && can_shoot) {
    // Cria o projétil na posição do player
    var _inst = instance_create_layer(x, y-7, "Instances", obj_bullet);
    
    // Configura o projétil
    _inst.speed = 8;
    _inst.direction = facing_dir; // Usa a direção salva
    _inst.image_angle = facing_dir; // Gira o sprite da bala
    
    can_shoot = false;
    alarm[0] = shoot_cooldown;
}

// --- SISTEMA DE ANIMAÇÃO ---

// Verifica se está se movendo
var _is_moving = (h_move != 0 || v_move != 0);

if (_is_moving) {
    // 1. Mapear Direção para Frame (0, 1, 2, 3)
    // A conta: (Direção / 90) + 0.5 arredondado para baixo pega o quadrante certo
    // Ex: 0/90 = 0 (Dir), 90/90 = 1 (Cima), etc.
    // O "% 4" garante que se der 360 graus (4), ele volte para 0.
    image_index = floor((facing_dir + 45) / 90) % 4;

    // 2. Efeito South Park (Wobble)
    // Somamos ao timer
    wobble_timer += wobble_spd;
    
    // Aplicamos o Seno (vai de -1 a 1) multiplicado pela quantidade de graus
    image_angle = sin(wobble_timer) * wobble_amount;
    
} else {
    // Quando parar:
    
    // 1. Reseta o ângulo suavemente para 0 (Lerp)
    image_angle = lerp(image_angle, 0, 0.2);
    
    // 2. (Opcional) Reseta o timer para a gingada sempre começar para o mesmo lado
    wobble_timer = 0; 
}

//
ii+=4/60
jj+=6/60

if (global.is_saving > 0) global.is_saving--;