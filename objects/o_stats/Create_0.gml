global.is_in_dialogue = false;

godmode = false;

// main Stats
max_hp = 1;
max_stamina = 10;

move_spd = 0.2;
mine_dmg = 1;
mine_spd = 0.08;
mine_level = 0;

stamina_drain_move = 2;
stamina_drain_moveblocked = 1;
stamina_drain_mine = 3;

// running stats
hp = max_hp;
stamina = max_stamina;

// resources
shinies = 0;
iron_ore = 0;


#region godmode
if(godmode)
{
	move_spd = 4;
	mine_dmg = 20;
	mine_spd = 4;
	mine_level = 0;	
}
#endregion