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

var _action_script = argument[0];
var _arg0 = argument[1];
var _arg1 = argument[2];
var _arg2 = argument[3];
var _arg3 = argument[4];
var _arg4 = argument[5];
var _arg5 = argument[6];
var _arg6 = argument[7];
var _arg7 = argument[8];
var _arg8 = argument[9];
var _arg9 = argument[10];
var _arg10 = argument[11];

var _scene_info = o_cutscene.scene_info;

switch argument_count
{
case 1: ds_list_add(_scene_info); break;
case 2: ds_list_add(_scene_info, [_action_script, _arg0] ); break;
case 3: ds_list_add(_scene_info, [_action_script, _arg0, _arg1] ); break;
case 4: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2] ); break;
case 5: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3]); break;
case 6: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4]); break;
case 7: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5]); break; 
case 8: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6]); break; 
case 9: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7]); break;
case 10: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8]); break;
case 11: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8, _arg9]); break;
case 12: ds_list_add(_scene_info, [_action_script, _arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8, _arg9, _arg10]); break;


}

