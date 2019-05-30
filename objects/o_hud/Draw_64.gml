/// @description Hier Beschreibung einfügen

draw_set_color(c_white);
if(o_stats.shinies > 0)
{
	draw_set_font(font_text);
	draw_sprite(s_shiny1_green, 0, 6, 6);
	draw_text(18, 7, string(o_stats.shinies));
}

if(o_stats.iron_ore > 0)
{
	draw_set_font(font_text);
	draw_sprite(s_iron_ore, 0, 10, 21);
	draw_text(18, 15, string(o_stats.iron_ore));
}

// stamina bar

stamina_length = lerp(stamina_length, 62 / o_stats.max_stamina * o_stats.stamina, 0.1);
var _stamina_col_full = rgb("000088");
var _stamina_col_empty = rgb("AA0000");

var _f_r = color_get_red(_stamina_col_full);
var _f_g = color_get_green(_stamina_col_full);
var _f_b = color_get_blue(_stamina_col_full);
var _e_r = color_get_red(_stamina_col_empty);
var _e_g = color_get_green(_stamina_col_empty);
var _e_b = color_get_blue(_stamina_col_empty);

var _c_r = percent_range(_e_r, _f_r, o_stats.stamina / o_stats.max_stamina * 100);
var _c_g = percent_range(_e_g, _f_g, o_stats.stamina / o_stats.max_stamina * 100);
var _c_b = percent_range(_e_b, _f_b, o_stats.stamina / o_stats.max_stamina * 100);

var _stamina_col = make_color_rgb(_c_r, _c_g, _c_b);

draw_sprite(s_text_sta, 0, 50, 8)
draw_set_color(rgb("000022"));
draw_rectangle(60, 6, 122, 8, false);

draw_set_color(_stamina_col);
draw_rectangle(60, 6, 60 + stamina_length, 8, false);