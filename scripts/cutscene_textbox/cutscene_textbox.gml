///@description adds a dialogue element for 
///@arg text
///@arg top (false = bottom)
///@arg continue_wait
///@arg continue_wait_skippable
///@arg color_dialog
///@arg color_frame
///@arg color_text
///@arg name
///@arg color_name

if(!textbox_showing)
{
	textbox_showing = true;
	if(argument_count >= 1) textbox_add(argument0);
	if(argument_count >= 2) textbox_add(argument0, argument1);
	if(argument_count >= 3) textbox_add(argument0, argument1, argument2);
	if(argument_count >= 4) textbox_add(argument0, argument1, argument2, argument3,);
	if(argument_count >= 5) textbox_add(argument0, argument1, argument2, argument3, argument4);
	if(argument_count >= 6) textbox_add(argument0, argument1, argument2, argument3, argument4, argument5);
	if(argument_count >= 7) textbox_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
	if(argument_count >= 8) textbox_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
	if(argument_count >= 9) textbox_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
	textbox_show_ext();
}