if(global.is_in_dialogue) exit;

if(state == "start")
{
	x = lerp(x, apos(x_pos_target), speed_show);
	y = lerp(y, apos(y_pos_target), speed_show);

	if(o_player.y_pos < player_y_pos_retreat)
	{
		if(o_player.x_pos == pos(x) && !global.achievement_caught_shopkeep)
		{
			textbox_show_char(char_shopkeep, "Hey! Ya sneaky, ain't ya!?", "Maybe i got ya something..", "Go check my shop once you're rich", "Cya!");
			global.achievement_caught_shopkeep = true;
		}
		x_pos_target = x_pos_start;
		y_pos_target = y_pos_start;
		speed_show = 0.05;
		state = "retreat";
	}
	if(o_player.y_pos < player_y_pos_retreat && x == apos(x_pos_start) && y == apos(y_pos_start))
	{
		killme();
	}
}
else if(state == "retreat")
{
	x = lerp(x, apos(x_pos_target), speed_show);
	y = lerp(y, apos(y_pos_target), speed_show);
}