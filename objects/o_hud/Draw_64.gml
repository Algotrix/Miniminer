/// @description Hier Beschreibung einfügen
if(o_stats.shinies > 0)
{
	draw_set_font(font_text);
	draw_sprite(s_shiny1_green, 0, 6, 6);
	draw_text(18, 7, string(o_stats.shinies));
}