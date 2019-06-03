if(status == "start")
{
	var _scene = scene_info[scene];
	var _len = array_length_1d(scene_info);
	
	switch(_len)
	{
		case 1: script_execute(_scene[0]); break;
		case 2: script_execute(_scene[1], _scene[1]); break;
		case 3: script_execute(_scene[2], _scene[1], _scene[2]); break;
		case 4: script_execute(_scene[3], _scene[1], _scene[2], _scene[3]); break;
		case 5: script_execute(_scene[4], _scene[1], _scene[2], _scene[3], _scene[4]); break;
		case 6: script_execute(_scene[5], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5]); break;
		case 7: script_execute(_scene[6], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5], _scene[6]); break;
		case 8: script_execute(_scene[7], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5], _scene[6], _scene[7]); break;
		case 9: script_execute(_scene[8], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5], _scene[6], _scene[7], _scene[8]); break;
		case 10: script_execute(_scene[9], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5], _scene[6], _scene[7], _scene[8], _scene[9]); break;
		case 11: script_execute(_scene[10], _scene[1], _scene[2], _scene[3], _scene[4], _scene[5], _scene[6], _scene[7], _scene[8], _scene[9], _scene[10]); break;
	}
}