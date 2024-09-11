extends Control

@export var ui_config_item:PackedScene
var toast 
signal goto_ui_publish_selection
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.config_changed.connect(update_info)
	update_info()
	pass # Replace with function body.
	
func update_info():
	var config = Global.get_config()
	for key in $VBoxContainer/ScrollContainer/VBoxContainer.get_children():
		key.queue_free()
	$VBoxContainer/GridContainer/LineEdit.text = config.cocos_tool_path
	for i in range(config.publish.size()):
		var item = ui_config_item.instantiate()
		item.set_index(i)
		item.set_info(config.publish[i])
		$VBoxContainer/ScrollContainer/VBoxContainer.add_child(item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_update_cocos_tool_path_pressed() -> void:
	Global.get_config().cocos_tool_path = $VBoxContainer/GridContainer/LineEdit.text
	pass # Replace with function body.


func _on_bt_back_pressed() -> void:
	goto_ui_publish_selection.emit()
	#get_tree().change_scene_to_file("res://ui/ui_tsubaki.tscn")
	pass # Replace with function body.


func _on_bt_add_config_pressed() -> void:
	Global.push_config({
		name="",
		source="",
		target=""
	})
	pass # Replace with function body.
