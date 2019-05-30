var hp_perc = hp / max_hp * 100;

if(!(hp < max_hp)) exit;

//layer = layer_get_depth(layer_blocks) + 1

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
		
		var _hp_per_side = max_hp / 4;
		var _reduce_amount_max_h = sprite_width / 2 / 4 * 3;
		var _reduce_amount_max_v = sprite_height / 2 / 4 * 3;
				
		var _reduce_left = _reduce_amount_max_h / _hp_per_side * damage_left;
		var _reduce_right = _reduce_amount_max_h / _hp_per_side * damage_right;
		var _reduce_top = _reduce_amount_max_v / _hp_per_side * damage_top;
		var _reduce_bottom = _reduce_amount_max_v / _hp_per_side * damage_bottom;

		draw_sprite_part(s_iron_block, image_index, _reduce_left, _reduce_top, 
			sprite_width - _reduce_left - _reduce_right, sprite_height - _reduce_top - _reduce_bottom, 
			x + _reduce_left, y + _reduce_top);
	}
	break;

}