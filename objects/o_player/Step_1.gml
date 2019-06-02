if(global.is_in_dialogue) exit;

if(a_drain_stamina <> 0)
{
	global.stamina -= a_drain_stamina;
	a_drain_stamina = 0;
}

if(a_apply_damage <> 0)
{
	global.hp -= a_apply_damage;
	a_apply_damage = 0;
}

