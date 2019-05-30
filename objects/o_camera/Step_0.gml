

camera = view_get_camera(0);

if(o_player.y % 8 == 0) 
{
	target_y = o_player.y - 56;
}

target_x = o_player.x - camera_get_view_width(camera) / 2;

camera_set_view_pos(camera, target_x, lerp(camera_get_view_y(camera), target_y, scroll_spd));