/// @description Hier Beschreibung einfügen

draw_set_color(c_white);

#region resources
if(global.shinies > 0)
{
	draw_set_font(font_text);
	draw_sprite(s_shiny1_green, 0, 6, 6);
	draw_text(18, 7, string(global.shinies));
}

if(global.iron_ore > 0)
{
	draw_set_font(font_text);
	draw_sprite(s_iron_ore, 0, 10, 21);
	draw_text(18, 15, string(global.iron_ore));
}
#endregion


#region stamina bar
stamina_length = max(lerp(stamina_length, 62 / global.max_stamina * global.stamina, 0.1), 0);
var _stamina_col_full = rgb("000088");
var _stamina_col_empty = rgb("AA0000");

var _f_r = color_get_red(_stamina_col_full);
var _f_g = color_get_green(_stamina_col_full);
var _f_b = color_get_blue(_stamina_col_full);
var _e_r = color_get_red(_stamina_col_empty);
var _e_g = color_get_green(_stamina_col_empty);
var _e_b = color_get_blue(_stamina_col_empty);

var _c_r = percent_range(_e_r, _f_r, global.stamina / global.max_stamina * 100);
var _c_g = percent_range(_e_g, _f_g, global.stamina / global.max_stamina * 100);
var _c_b = percent_range(_e_b, _f_b, global.stamina / global.max_stamina * 100);

var _stamina_col = make_color_rgb(_c_r, _c_g, _c_b);

draw_sprite(s_text_sta, 0, 50, 8)
draw_set_color(rgb("000022"));
draw_rectangle(60, 6, 122, 8, false);

draw_set_color(_stamina_col);
draw_rectangle(60, 6, 60 + stamina_length, 8, false);
#endregion

#region debug
if(global.drawdebug)
{
	draw_set_color(c_black);
	draw_text(64, 16, global.debug0);
	draw_text(64, 26, global.debug1);
	draw_text(64, 36, global.debug2);
	draw_text(64, 46, global.debug3);
	
}


#endregion