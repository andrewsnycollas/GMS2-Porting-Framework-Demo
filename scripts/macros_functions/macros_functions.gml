// Enum para identificar a fonte de input (Melhor que usar strings ou números mágicos)
enum INPUT_METHOD {
    KEYBOARD,
    GAMEPAD
}

// Variável Global para controlar o estado atual
global.input_current_method = INPUT_METHOD.KEYBOARD;

// --- MACROS KEYBOARD ---
#macro K_UP         vk_up
#macro K_DOWN       vk_down
#macro K_LEFT       vk_left
#macro K_RIGHT      vk_right
#macro K_SHOOT      vk_space
#macro K_ACCEPT     vk_enter

// --- MACROS GAMEPAD (XBOX/Padrao) ---
#macro GP_ID        0        // Slot do controle (pode ser dinâmico depois)
#macro G_UP         gp_padu
#macro G_DOWN       gp_padd
#macro G_LEFT       gp_padl
#macro G_RIGHT      gp_padr
#macro G_SHOOT      gp_face1 // X no Xbox / Quadrado no PS
#macro G_ACCEPT     gp_face3 // A no Xbox / X no PS
#macro G_DEADZONE   0.2      // Deadzone para o analógico

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function check_input_source() {
    // 1. Verificar se alguma tecla do teclado foi pressionada
    if (keyboard_check(vk_anykey)) {
        global.input_current_method = INPUT_METHOD.KEYBOARD;
    } 
    
    // 2. Verificar inputs do Gamepad (Botões ou Analógico)
    // Nota: Verificamos se o controle está conectado antes para evitar erros
    if (gamepad_is_connected(GP_ID)) {
        // Verifica botões principais
        if (gamepad_button_check(GP_ID, gp_face1) || gamepad_button_check(GP_ID, gp_face2) || 
            gamepad_button_check(GP_ID, gp_face3) || gamepad_button_check(GP_ID, gp_face4) ||
            gamepad_button_check(GP_ID, gp_start) || gamepad_button_check(GP_ID, gp_select)) {
            
            global.input_current_method = INPUT_METHOD.GAMEPAD;
        }
        
        // Verifica movimento do analógico (se passou da deadzone)
        var _h_axis = gamepad_axis_value(GP_ID, gp_axislh);
        var _v_axis = gamepad_axis_value(GP_ID, gp_axislv);
        
        if (abs(_h_axis) > G_DEADZONE || abs(_v_axis) > G_DEADZONE) {
            global.input_current_method = INPUT_METHOD.GAMEPAD;
        }
    }
}

global.is_saving=0