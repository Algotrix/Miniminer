if(a_start == true)
{
	if(ds_list_size(scene_info) >= 1)
	{
		status = "start";	
		global.is_in_cutscene = true;
	}
	a_start = false;
}