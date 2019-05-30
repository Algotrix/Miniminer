/// @description Hier Beschreibung einfügen
/// @description Hier Beschreibung 
var hp_perc = hp / max_hp * 100;

if(hp_perc <= 80 && hp_perc > 60)
{
	draw_sprite(s_crack1, 0, x, y);
}
else if(hp_perc <= 60 && hp_perc > 40)
{
	draw_sprite(s_crack1, 1, x, y);
}
else if(hp_perc <= 40 && hp_perc > 20)
{
	draw_sprite(s_crack1, 2, x, y);
}
else if(hp_perc <= 20)
{
	draw_sprite(s_crack1, 3, x, y);
}