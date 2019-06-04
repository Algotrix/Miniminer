

if(o_player.y % 8 == 0) 
{
	target_y = o_player.y - 56;
	
	if(target_y < 0) target_y = 0;
}

target_x = lerp(target_x, max(o_player.x - camera_get_view_width(camera) / 2, 0), 0.1);

camera_set_view_pos(camera, target_x, lerp(camera_get_view_y(camera), target_y, scroll_spd));