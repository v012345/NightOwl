extends Control
var pr = 0
var select_src = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ProgressBar.value = 50
	var heartbeat_timer = Timer.new()
	heartbeat_timer.wait_time = 1
	heartbeat_timer.one_shot = false  # 循环触发
	heartbeat_timer.autostart = true  # 自动启动
	heartbeat_timer.connect("timeout",update_progress)
	add_child(heartbeat_timer)
	#var output = []
	#print(OS.execute("D:\\NightOwlToolsV2\\NightOwlToolsV2\\NightOwlToolsV2.exe",["D:\\NightOwlToolsV2\\NightOwlToolsV2\\main.lua"],output,true))
	##print(OS.get_executable_path())
	##pid = OS.create_process("D:\\NightOwlToolsV2\\NightOwlToolsV2\\NightOwlToolsV2.exe", ["D:\\NightOwlToolsV2\\NightOwlToolsV2\\main.lua"])
	#print(pid)
 #
#
	#for x in output:
		#print(x)
	##print("jjjjjj")
	##print(_G.gd)
	#var result = client.connect_to_host("127.0.0.1", 12345)
	#if result != OK:
		#print("Failed to connect to server!")
	#else:
		#print("Connected to server!")
	##var data = "jjjjjjjj"
	##client.set_no_delay(true)
	#print(client.STATUS_CONNECTED)
	#if pid and !OS.is_process_running(pid):
		#print("Process has terminated")
		#pid = null
	#else:
		#print("gpgpg")
	#print(client.poll())
	#if client.get_available_bytes() > 0:
		#var data = client.get_utf8_string(client.get_available_bytes())
		#print("Received from server: ", data)
	pass # Replace with function body.

func update_progress():
	$ProgressBar.value = pr
	pr+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if pid and !OS.is_process_running(pid):
		##print("Process has terminated")
		##pid = null
		#pass
	#else:
		#pass
		#print("gpgpg")
	pass


func _on_button_pressed() -> void:
	var toast = Toast.new("This is the default toast", Toast.LENGTH_SHORT)
	get_node("/root").add_child(toast)
	toast.show()
	
	#var label = Label.new();
	#label.text="jjjjjjjjjjjjjj"
	##add_child(label)
	#get_node("/root").add_child(label)
	#Socket.put_utf8_string("_on_button_pressed\n")
	#print(OS.is_process_running(pid))
	#if pid and !OS.is_process_running(pid):
		#print("Process has terminated")
		#pid = null
	#var output = []
	##OS.execute("powershell.exe", ["-Command", "D:\\NightOwlToolsV2\\NightOwlToolsV2\\NightOwlToolsV2.exe"], output)
	##print(OS.execute("D:/NightOwlToolsV2/NightOwlToolsV2/NightOwlToolsV2.exe",[],output))
	##var output = []
	##OS.execute("D:\\c.exe", ["jldj","ji"], output)
	##for x in output:
		##print(x)
	#
	##client.put_utf8_string("jjjjjjjjj")
	##client.put_data("Hello world".to_utf8_buffer())
	#print(client.poll())
	#var _status = client.get_status()
	#print(_status)
	#if client.get_available_bytes() > 0:
		#var data = client.get_utf8_string(client.get_available_bytes())
		#print("Received from server: ", data)
	#if _status != client.STATUS_CONNECTED:
		#print("Error: Stream is not currently connected.")
		##return false
	#var data = "jiiehfsfiefjdkjfd\n"
	#client.put_utf8_string(data)
	#client.flush()
	#print(client.poll())
		#return false
	#return true
	#if client.get_available_bytes() > 0:
		#data = client.get_utf8_string(client.get_available_bytes())
		#print("Received from server: ", data)
	pass # Replace with function body.


func _on_button_literally_pressed() -> void:
	Socket.put_utf8_string("_on_button_literally_pressed\n")
	pass # Replace with function body.


func _on_control_select_src(a) -> void:
	select_src = a
	print()
	pass # Replace with function body.


func _on_control_publish_ui() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_publish_ui\n")
		pass
	else:
		OS.alert('请选择一个发布目标', '警告')
	pass # Replace with function body.


func _on_control_publish_plist() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_publish_plist\n")
	else:
		OS.alert('请选择一个发布目标', '警告')
	pass # Replace with function body.


func _on_control_delete_db() -> void:
	if select_src!=null:
		Socket.put_utf8_string(Global.target[select_src]+"_delete_db\n")
	else:
		OS.alert('请选择一个消除目标', '警告')
	pass # Replace with function body.
