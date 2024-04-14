function btn_create(_type, _x, _y){
	var _btn = instance_create_depth(_x, _y, -10, obj_btn);
	_btn.type = _type;
	with (_btn) event_user(10);
	return _btn;
}