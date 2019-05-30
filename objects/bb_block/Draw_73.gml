/// @description Hier Beschreibung einfügen
/// @description Hier Beschreibung 
var hp_perc = hp / max_hp * 100;

if(!(hp < max_hp)) exit;

switch(destroy_type)
{	
	case "crack":
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
	break;
	case "reduce":
	{
		// visible = false;
		// sprite_index = -1;
		image_xscale = 0;
		image_yscale = 0;

		draw_sprite_part(s_iron_block, image_index, reduce_left, reduce_up, 
			8 - reduce_left - reduce_right, 8 - reduce_up - reduce_down, x, y);
	}
	break;

}