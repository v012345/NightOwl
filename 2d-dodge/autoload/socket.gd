extends Node

var client := StreamPeerTCP.new()
var is_connected_ := false
var pid = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 尝试连接服务器
	client.connect_to_host("127.0.0.1", 12345)
	client.poll()
	#await get_tree().create_timer(1).timeout
	if client.get_status() == StreamPeerTCP.STATUS_CONNECTED:
		print("Connected to server.")
		is_connected_ = true
		# 启动心跳计时器
		start_heartbeat()
		return
	else:
		client.disconnect_from_host()
		#OS.kill(pid)
		print("Failed to connect to server.")
	pass # Replace with function body.

# 心跳发送逻辑
func _on_heartbeat_timeout():
	if is_connected_:
		client.put_utf8_string("ping\n")
		
# 开始心跳机制
func start_heartbeat():
	var heartbeat_timer = Timer.new()
	heartbeat_timer.wait_time = 1
	heartbeat_timer.one_shot = false  # 循环触发
	heartbeat_timer.autostart = true  # 自动启动
	heartbeat_timer.connect("timeout",Callable(self, "_on_heartbeat_timeout"))
	add_child(heartbeat_timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_connected_ and client.get_available_bytes() > 0:
		var m = client.get_partial_data(client.get_u32())
		if m[0] == OK:
			var byte_array = PackedByteArray(m[1])
			var str1 = byte_array.get_string_from_utf8()
			if str1 != "pong":
				print(str1)  # 输出: 这个

	
func put_utf8_string(s):
	if is_connected_:
		client.put_utf8_string(s)

# 处理连接断开或超时
func disconnect_from_host():
	if is_connected_:
		client.disconnect_from_host()
		is_connected_ = false
		print("Disconnected from server.")
