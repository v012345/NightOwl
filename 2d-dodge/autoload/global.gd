extends Node

var gd = "fsdf"
var config_path = "user://lua_use.cfg"
var default = {
	cocos_tool_path="jicf",
	publish=[
		{
			name="abc",
			source="abc",
			target="abc",
		}
	]
}
var config = null
var target = [
	"korea",
	"taiwan",
	"japan",
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_config()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.unuse(delta)
	pass

func load_config():
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	var err = config.load(config_path)
	if err != OK:
		config = default
	else:
		
		pass
	

	# Store some values.
	config.set_value("Player1", "player_name",[{a="jiji"},{a="jiji"}] )
	config.set_value("Player1", "best_score", 10)
	config.set_value("Player2", "player_name", "V3geta")
	config.set_value("Player2", "best_score", 9011101)

	# Save it to a file (overwrite if already exists).
	config.save("user://config.cfg")
	
	var score_data = {}
	config = ConfigFile.new()

	# Load data from a file.


	# If the file didn't load, ignore it.


# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		var player_name = config.get_value(player, "player_name")
		var player_score = config.get_value(player, "best_score")
		score_data[player_name] = player_score
	pass

func unuse(u):
	return u
