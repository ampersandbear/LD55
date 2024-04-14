// 
function camera_nudge(_x, _y)
{
	with obj_control
	{
		nudge_x = _x < 0 ? min(_x, nudge_x) : max(_x, nudge_x);
		nudge_y = _y < 0 ? min(_y, nudge_y) : max(_y, nudge_y);
	}
}