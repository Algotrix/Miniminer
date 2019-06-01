///@description pre-process actions

#region recieve damage
if(a_recieve_damage != 0)
{
	var _real_damage = a_recieve_damage;
	
	#region destroy_type reduce
	
	if(destroy_type == "reduce")
	{
		var _max_dmg_per_side = max_hp / 4;
		
		if(a_recieve_damage_hit_from == dir_bottom) 
		{
			_real_damage = min(_max_dmg_per_side - damage_bottom, _real_damage);
			damage_bottom += _real_damage
		}
		if(a_recieve_damage_hit_from == dir_top) 
		{
			_real_damage = min(_max_dmg_per_side - damage_top, _real_damage);
			damage_top += _real_damage;
		}
		if(a_recieve_damage_hit_from == dir_left) 
		{
			_real_damage = min(_max_dmg_per_side - damage_left, _real_damage);
			damage_left += _real_damage;
		}
		if(a_recieve_damage_hit_from == dir_right) 
		{
			_real_damage = min(_max_dmg_per_side - damage_right, _real_damage);
			damage_right += _real_damage;
		}
	}
	#endregion
	
	hp -= _real_damage;
	a_recieve_damage = 0;
	a_recieve_damage_hit_from = dir_none;
}
#endregion

