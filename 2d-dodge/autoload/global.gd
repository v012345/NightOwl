extends Node

var _config_path = "user://lua_use.cfg"
var default = {
	cocos_tool_path = "C:\\Cocos\\Cocos Studio\\Cocos.Tool.exe",
	publish = [
		{
			name = "abc",
			source = "abc",
			target = "abc",
		}
	]
}
var _config = null

func get_config():
	return _config

func _ready() -> void:
	_load_config()

func _process(_delta: float) -> void:
	pass

func _load_config():
	var loader = ConfigFile.new()
	var err = loader.load(_config_path)
	if err != OK:
		_config = default.duplicate(true)
	else:
		_config = loader.get_value("black_moon", "publish_config")

func _exit_tree():
	var saver = ConfigFile.new()
	saver.set_value("black_moon", "publish_config", _config)
	saver.save(_config_path)
