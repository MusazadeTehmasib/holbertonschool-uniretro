var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down); 
var accept_key = keyboard_check_pressed(ord("Z"));

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

if accept_key{
	
switch(menu_level) {
	case 0:
		switch(pos){
			//start game
			case 0: room_goto_next(); break;
			//settings
			case 1: menu_level=1; break;
			//credits
			case 2: break;
			//quit
			case 3: game_end(); break;
			}
		break;
		
	//settings
	case 1:
		menu_level = 1;
		switch(pos) {
			//window size
			case 0: break;
			//birghness
			case 1: break;
			//controls
			case 2: break;
			//back
			case 3: menu_level = 0; break;
		
		}
	}
}