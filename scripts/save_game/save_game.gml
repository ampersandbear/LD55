function save_game(){
	var _file = file_text_open_write(working_directory + "data.hh");
	if (_file == -1) return;

	file_text_write_string(_file, game_version);				file_text_writeln(_file);
	file_text_write_real(_file, global.best_wave);				file_text_writeln(_file);
	file_text_write_real(_file, global.tutorial);				file_text_writeln(_file);
	file_text_write_real(_file, global.mutations_tutorial);		file_text_writeln(_file);
	file_text_write_real(_file, global.masterhead_tutorial);	file_text_writeln(_file);

	file_text_close(_file)
}