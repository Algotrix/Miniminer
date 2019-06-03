///@arg seconds

var _seconds = argument0;

timer++;

if(timer >= _seconds * room_speed)
{
	timer = 0;
	cutscene_end_action();
}