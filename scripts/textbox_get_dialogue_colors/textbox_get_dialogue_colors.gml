///@description returns char_color_dialog, char_color_frame, char_color_text
///@arg char
var _char = argument0;
char_color_dialog = c_black;
char_color_frame = c_white;
char_color_text = c_white;
switch(_char)
{
	case(char_player):
	{
		char_color_dialog = c_black;
		char_color_frame = c_white;
		char_color_text = c_white;
		break;
	}
	case(char_shopkeep):
	{
		char_color_dialog = make_color_rgb(0, 0, 100);
		char_color_frame = make_color_rgb(0, 0, 200);
		char_color_text = c_white;
		break;
	}
	
	
}