/// @description trace(arg0, arg1, arg2, ..., arg15)
/// @param arg0
/// @param  arg1
/// @param  arg2
/// @param  ...
/// @param  arg15
function trace() {
	// This function is a replacement for show_debug_message.
	
	if (code_is_compiled()) exit;

	var s = "";
	for (var i = 0; i < argument_count; i++){
	    if (i) s += ", ";
	    s += string(argument[i]);
	}
	show_debug_message(s);
}
