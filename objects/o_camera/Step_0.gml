

camera = view_get_camera(0);

if(o_player.y % 8 == 0) 
{
	target_y = o_player.y - 56;
}



camera_set_view_pos(camera, camera.x, lerp(camera_get_view_y(camera), target_y, scroll_spd));
