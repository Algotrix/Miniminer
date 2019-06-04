/// @description Hier Beschreibung einfügen
if(state == "wait")
{
	y_start = y;
	if(abs(o_player.x - x) <= drop_distance)
	{
		y_target = o_player.y + o_player.sprite_height / 2;
		state = "drop_phase_1";
	}

	if(drop_count == 0) state = "end";
}
else if(state == "drop_phase_1")
{
	var _next_y = percent_range(y_start, y_target, drop_percent_phase2)
	y = approach(y, _next_y, drop_speed_phase1);
	
	if(y >= _next_y)
	{
		state = "drop_phase_2";
	}
}
else if(state == "drop_phase_2")
{
	var _next_y = percent_range(y_start, y_target, drop_percent_phase3)
	y = approach(y, _next_y, drop_speed_phase2);
	
	if(y >= _next_y)
	{
		state = "drop_phase_3";
	}
}
else if(state == "drop_phase_3")
{
	var _next_y = y_target;
	y = approach(y, _next_y, drop_speed_phase3);
	
	if(y >= _next_y)
	{
		state = "retreat";
	}
}
else if(state == "retreat")
{
	var _next_y = y_start;
	y = approach(y, _next_y, retreat_speed);
	
	if(y <= _next_y)
	{
		drop_count -= 1;
		state = "wait";
	}
}

if(abs(o_player.x - x) >= retreat_distance && state != "wait" && state != "retreat") 
{
	state = "retreat";
}