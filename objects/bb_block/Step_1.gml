///@description pre-process actions

#region recieve damage
if(a_recieve_damage != 0)
{
	hp -= a_recieve_damage;
	
	if(a_recieve_damage_hit_from == dir_down) 
	{
		reduce_down +=1;
	}
	if(a_recieve_damage_hit_from == dir_up) 
	{
		reduce_up += 1;
	}
	if(a_recieve_damage_hit_from == dir_left) 
	{
		reduce_left += 1;
	}
	if(a_recieve_damage_hit_from == dir_right) 
	{
		reduce_right += 1;
	}
	
	a_recieve_damage = 0;
	a_recieve_damage_hit_from = dir_none;
}
#endregion

