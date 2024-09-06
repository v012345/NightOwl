extends Control

var config = [
	{
		name = "qooapp",
		source = "C:/Users/Meteor/Desktop/work/Closers.cocos/resource/ui/branches/qooapp/zhtw",
		target = "C:/Users/Meteor/Desktop/work/Closers.cocos/client/branches/qooapp/Resources/res_zhtw"
	},
	{

	}
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(config)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.unuse(delta)
	pass
