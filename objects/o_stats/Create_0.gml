global.is_in_dialogue = false;

godmode = true;

// Main Stats
player_hp = 1;
move_spd = 0.2;
mine_dmg = 1;
mine_spd = 0.08;
mine_level = 0;

// Resources
shinies = 0;
iron_ore = 0;


#region godmode
if(godmode)
{
	player_hp = 1;
	move_spd = 4;
	mine_dmg = 20;
	mine_spd = 4;
	mine_level = 0;	
}
#endregion