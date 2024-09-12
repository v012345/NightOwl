extends Node

signal config_changed
var _config_path = "user://lua_use.cfg"
var default = {
	cocos_tool_path = "C:\\Cocos\\Cocos Studio\\Cocos.Tool.exe",
	publish = [
		{
			name = "name",
			source = "source",
			target = "target",
		}
	]
}
var _config = null

func get_config():
	return _config

func get_publish(index):
	return _config.publish[index]

func remove_config(index):
	_config.publish.pop_at(index)
	config_changed.emit()

func push_config(c):
	_config.publish.append(c)
	config_changed.emit()

func update_config(index,c):
	for x in c:
		_config.publish[index][x] = c[x]
	config_changed.emit()

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
