extends Node

# all body textures
var body_collection: Dictionary = {
	"01": preload("res://assets/character/body/body_1.png"),
	"02": preload("res://assets/character/body/body_2.png"),
}

# all eye textures
var eyes_collection: Dictionary = {
	"01": preload("res://assets/character/eyes/eyes_1.png"),
	"02": preload("res://assets/character/eyes/eyes_2.png"),
	"03": preload("res://assets/character/eyes/eyes_3.png"),
	"04": preload("res://assets/character/eyes/eyes_4.png"),
	"05": preload("res://assets/character/eyes/eyes_5.png"),
}

# all arms textures
var arms_collection: Dictionary = {
	"01": preload("res://assets/character/arms/arms_1.png"),
	"02": preload("res://assets/character/arms/arms_2.png"),
	"03": preload("res://assets/character/arms/arms_3.png"),
	"04": preload("res://assets/character/arms/arms_4.png"),
}

# all legs textures
var legs_collection: Dictionary = {
	"01": preload("res://assets/character/legs/legs_1.png"),
	"02": preload("res://assets/character/legs/legs_2.png"),
	"03": preload("res://assets/character/legs/legs_3.png"),
}

# all body colors
var body_colors: Dictionary = {
	"Normal":  Color.BLACK,
	"Modern":  Color.DIM_GRAY,
	"Sleak":   Color.LIGHT_SLATE_GRAY,
	"Chique":  Color.DARK_SLATE_GRAY,
}

var random_names: Array[String] = [
	"barry",
	"bert",
	"bob",
	"gary",
	"jeff",
	"jim",
	"percy",
]
