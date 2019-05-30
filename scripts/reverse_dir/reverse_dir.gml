///@arg dir
var _dir = argument0;

if(_dir == dir_down) 
{
	return dir_up;
}
if(_dir == dir_up) 
{
	return dir_down;
}
if(_dir == dir_left) 
{
	return dir_right;
}
if(_dir == dir_right) 
{
	return dir_left;
}
else
{
	return dir_none;
}