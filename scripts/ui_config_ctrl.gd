extends Control

@export var ui_config_item:PackedScene

var config = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	config = Global.get_config()
	$GridContainer/LineEdit.text = config.cocos_tool_path
	$ScrollContainer/VBoxContainer.add_child(ui_config_item.instantiate())
	$ScrollContainer/VBoxContainer.add_child(ui_config_item.instantiate())
	$ScrollContainer/VBoxContainer.add_child(ui_config_item.instantiate())
	$ScrollContainer/VBoxContainer.add_child(ui_config_item.instantiate())
	print(Global.get_config())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_update_cocos_tool_path_pressed() -> void:
	config.cocos_tool_path = $GridContainer/LineEdit.text
	pass # Replace with function body.
