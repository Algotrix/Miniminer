/// @description Hier Beschreibung einfügen
continue_wait = max(continue_wait - 1, 0);
if(continue_wait <= 0)
{
	if(o_input.key_action)
	{
		global.is_in_dialogue = false;
		killme();
	}
}