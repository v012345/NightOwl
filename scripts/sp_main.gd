extends Control
var select_src = null
func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_control_select_src(a) -> void:
	if a >= 0 and Global.get_publish(a):
		select_src = a
		$ui_publish_selection.update_src_and_tag(Global.get_publish(a))

func _on_control_publish_ui() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_publish_ui\n")
		pass
	else:
		OS.alert('请选择一个发布目标', '警告')

func _on_control_publish_plist() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_publish_plist\n")
	else:
		OS.alert('请选择一个发布目标', '警告')


func _on_control_delete_db() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_delete_db\n")
	else:
		OS.alert('请选择一个消除目标', '警告')


func _on_ui_publish_selection_goto_ui_config() -> void:
	$ui_publish_selection.visible = false
	$ui_config.visible = true
	pass # Replace with function body.


func _on_ui_config_goto_ui_publish_selection() -> void:
	$ui_publish_selection.visible = true
	$ui_config.visible = false
	pass # Replace with function body.
