///@arg cutscene
///@arg action_script
///@arg arg0
///@arg arg1
///@arg arg2
///@arg arg3
///@arg arg4
///@arg arg5
///@arg arg6
///@arg arg7
///@arg arg8
///@arg arg9
///@arg arg10

var _cutscene = argument[0];
var _action_script = argument[1];

switch argument_count
{
case 2: ds_list_add(_cutscene.scene_info, [_action_script] ); break;
case 3: ds_list_add(_cutscene.scene_info, [_action_script, argument[2]] ); break;
case 4: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3]] ); break;
case 5: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4]]); break;
case 6: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5]]); break;
case 7: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6]]); break; 
case 8: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]); break; 
case 9: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]]); break;
case 10: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]]); break;
case 11: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]]); break;
case 12: ds_list_add(_cutscene.scene_info, [_action_script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]]); break;


}

