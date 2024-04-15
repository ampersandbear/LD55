function load_game(){
	var _file = file_text_open_read(working_directory + "data.hh");
	if (_file == -1) return;

	var _version = file_text_read_string(_file);	file_text_readln(_file);
	global.best_wave = file_text_read_real(_file);	file_text_readln(_file);
	global.tutorial = file_text_read_real(_file);	file_text_readln(_file);

	file_text_close(_file);
}