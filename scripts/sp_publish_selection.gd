extends Control

@export var drop_list:OptionButton = null
signal select_src
signal publish_ui
signal publish_plist
signal delete_db
signal goto_ui_config

func _ready() -> void:
	Global.config_changed.connect(update_drop_list)
	update_drop_list()


func update_drop_list():
	var c = Global.get_config().publish
	drop_list.clear()
	for x in c:
		drop_list.add_item(x.name)
	select_src.emit(drop_list.get_selected_id())

func update_src_and_tag(c):
	$GridContainer/le_source.text = c.source
	$GridContainer/le_target.text = c.target


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	select_src.emit(index)
	pass # Replace with function body.


func _on_button_publish_ui_pressed() -> void:
	publish_ui.emit()
	pass # Replace with function body.


func _on_button_publish_plist_pressed() -> void:
	publish_plist.emit()
	pass # Replace with function body.


func _on_button_delete_db_pressed() -> void:
	delete_db.emit()
	pass # Replace with function body.


func _on_bt_change_config_pressed() -> void:
	goto_ui_config.emit()
	pass # Replace with function body.
