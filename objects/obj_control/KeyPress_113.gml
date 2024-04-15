/// @description go to shop
if (debug) {
	transition_to(rm_shop)
	with (obj_unit) if (!head) instance_destroy();
}