extends Control

@export var drop_list:OptionButton = null
signal select_src
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("jj")
	print(drop_list)
	var flags = [
		"res://flag_icons/south-korea.png",
		"res://flag_icons/taiwan.png",
		"res://flag_icons/japan.png",
	]
	for i in range(3):
		var image = Image.load_from_file(flags[i])
		var texture = ImageTexture.create_from_image(image)
		texture.set_size_override(Vector2i(25,25))
		drop_list.set_item_icon(i,texture)

	

	print(drop_list.get_item_icon(0))
	print(drop_list.get_item_icon(1))
	print(drop_list.get_item_icon(2))
	#var img = Image.new()  # 创建一个 Image 实例
	#img.load("res://flag_icons/japan.png")  # 通过实例调用 load 方法
	#drop_list.set_item_icon(0, img)  # 使用加载的图标
	#drop_list.set_item_icon(1, img)  # 使用加载的图标
	#drop_list.set_item_icon(2, img)  # 使用加载的图标
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_option_button_item_selected(index: int) -> void:
	select_src.emit(index)
	pass # Replace with function body.
