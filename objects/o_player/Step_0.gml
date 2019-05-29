/// @description Hier Beschreibung einfügen
get_pos();
//dbg(string(x_pos) + "," + string(y_pos));
switch(state)
{
	case("idle"):
		if(input.up)
		{
			move_tile(0);
			dbg("up")
		}
		else if(input.right)
		{
			move_tile(1);
		}
		else if(input.down)
		{
			move_tile(2);
		}
		else if(input.left)
		{
			move_tile(3);
			dbg("left")
		}
	
		break;

}