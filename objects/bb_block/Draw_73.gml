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
		image_alpha = 0;

		draw_sprite_part(s_iron_block, image_index, reduce_left, reduce_up, 
			8 - reduce_left - reduce_right, 8 - reduce_up - reduce_down, 
			x + reduce_left, y + reduce_up);
	}
	break;

}