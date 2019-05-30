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

stamina_length = lerp(stamina_length, 116 / o_stats.max_stamina * o_stats.stamina, 0.1);
draw_sprite(s_text_sta, 0, 50, 8)
draw_set_color(rgb("000033"));
draw_rectangle(60, 6, 122, 8, false);

draw_set_color(rgb("000066"));
draw_rectangle(60, 6, 6 + stamina_length, 8, false);