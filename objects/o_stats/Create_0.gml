global.godmode = true;
global.drawdebug = true;

// main Stats
global.max_hp = 100;
global.max_stamina = 100;

global.move_spd = 0.2;
global.mine_dmg = 1;
global.mine_spd = 0.08;
global.mine_level = 0;
global.jump_speed = 1.3;
global.jump_mode = false;
global.jump_max_speed_for_move = 0.3;
global.jump_max_distance_for_move = 2;
global.grav = 0.1;

global.stamina_drain_move = 2;
global.stamina_drain_moveblocked = 1;
global.stamina_drain_mine = 5;
global.stamina_drain_jump = 5;

// running stats
global.hp = global.max_hp;
global.stamina = global.max_stamina;

// resources
global.shinies = 0;
global.iron_ore = 0;

// hud
global.hud_show_healthbar = false;


#region godmode
if(global.godmode)
{
	global.move_spd = 4;
	global.mine_dmg = 20;
	global.mine_spd = 4;
	global.mine_level = 0;	
}
#endregion

// achievements
global.achievement_caught_shopkeep = false; // when he comes down, approach him from below
global.achievement_unlimited_potions = false; // let me run out of stamina enough times
global.achievment_shattered = false; // as shiny fall 5 tiles
global.achievment_boxxy = false; // got the box
global.achievment_broken = false; // after falling down, complete the game with broken legs