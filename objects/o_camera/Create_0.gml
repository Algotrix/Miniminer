/// @description Hier Beschreibung einfügen
camera = view_get_camera(0);
target_y = o_player.y - 56;
target_x = max(o_player.x - camera_get_view_width(camera) / 2, 0);