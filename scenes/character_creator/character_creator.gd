extends Node2D

@onready var character: Character = $Character

# constants
const MAX_NAME_LENGTH: int = 6

# selected indexes
var current_body_index = 0
var current_eyes_index = 0
var current_arms_index = 0
var current_legs_index = 0
var current_color_index = 0

# resource keys
var body_keys = Global.body_collection.keys()
var eyes_keys = Global.eyes_collection.keys()
var arms_keys = Global.arms_collection.keys()
var legs_keys = Global.legs_collection.keys()
var color_keys = Global.body_colors.keys()


func _ready():
	randomize()


func _on_body_previous_button_pressed() -> void:
	current_body_index -= 1
	
	if current_body_index < 0:
		current_body_index = len(body_keys) - 1
		
	var body_key = body_keys[current_body_index]
	
	if Global.body_collection.has(body_key):
		character.set_body_texture(Global.body_collection[body_key])
		_update_selected_body_label(body_key)


func _on_body_next_button_pressed() -> void:
	current_body_index += 1
	
	if current_body_index >= len(body_keys):
		current_body_index = 0
		
	var body_key = body_keys[current_body_index]
		
	if Global.body_collection.has(body_key):
		character.set_body_texture(Global.body_collection[body_key])
		_update_selected_body_label(body_key)
		
		
func _on_eyes_previous_button_pressed() -> void:
	current_eyes_index -= 1
	
	if current_eyes_index < 0:
		current_eyes_index = len(eyes_keys) - 1
		
	var eyes_key = eyes_keys[current_eyes_index]
	
	if Global.eyes_collection.has(eyes_key):
		character.set_eyes_texture(Global.eyes_collection[eyes_key])
		_update_selected_eyes_label(eyes_key)


func _on_eyes_next_button_pressed() -> void:
	current_eyes_index += 1
	
	if current_eyes_index >= len(eyes_keys):
		current_eyes_index = 0
		
	var eyes_key = eyes_keys[current_eyes_index]
		
	if Global.eyes_collection.has(eyes_key):
		character.set_eyes_texture(Global.eyes_collection[eyes_key])
		_update_selected_eyes_label(eyes_key)
		
		
func _on_arms_previous_button_pressed() -> void:
	current_arms_index -= 1
	
	if current_arms_index < 0:
		current_arms_index = len(arms_keys) - 1
		
	var arms_key = arms_keys[current_arms_index]
	
	if Global.arms_collection.has(arms_key):
		character.set_arms_texture(Global.arms_collection[arms_key])
		_update_selected_arms_label(arms_key)


func _on_arms_next_button_pressed() -> void:
	current_arms_index += 1
	
	if current_arms_index >= len(arms_keys):
		current_arms_index = 0
		
	var arms_key = arms_keys[current_arms_index]
		
	if Global.arms_collection.has(arms_key):
		character.set_arms_texture(Global.arms_collection[arms_key])
		_update_selected_arms_label(arms_key)
		
		
func _on_legs_previous_button_pressed() -> void:
	current_legs_index -= 1
	
	if current_legs_index < 0:
		current_legs_index = len(legs_keys) - 1
		
	var legs_key = legs_keys[current_legs_index]
	
	if Global.legs_collection.has(legs_key):
		character.set_legs_texture(Global.legs_collection[legs_key])
		_update_selected_legs_label(legs_key)


func _on_legs_next_button_pressed() -> void:
	current_legs_index += 1
	
	if current_legs_index >= len(legs_keys):
		current_legs_index = 0
		
	var legs_key = legs_keys[current_legs_index]
		
	if Global.legs_collection.has(legs_key):
		character.set_legs_texture(Global.legs_collection[legs_key])
		_update_selected_legs_label(legs_key)
		
		
func _on_color_previous_button_pressed() -> void:
	current_color_index -= 1
	
	if current_color_index < 0:
		current_color_index = len(color_keys) - 1
		
	var color_key = color_keys[current_color_index]
	
	if Global.body_colors.has(color_key):
		var color: Color = Global.body_colors[color_key]
		character.set_color(color)
		_update_selected_color_ui(color_key, color)


func _on_color_next_button_pressed() -> void:
	current_color_index += 1
	
	if current_color_index >= len(color_keys):
		current_color_index = 0
		
	var color_key = color_keys[current_color_index]
	
	if Global.body_colors.has(color_key):
		var color: Color = Global.body_colors[color_key]
		character.set_color(color)
		_update_selected_color_ui(color_key, color)
		

func _on_randomize_button_pressed() -> void:
	# generate random keys
	current_body_index = randi() % body_keys.size()
	current_eyes_index = randi() % eyes_keys.size()
	current_arms_index = randi() % arms_keys.size()
	current_legs_index = randi() % legs_keys.size()
	current_color_index = randi() % color_keys.size()
	
	var body_key: String = body_keys[current_body_index]
	var eyes_key: String = eyes_keys[current_eyes_index]
	var arms_key: String = arms_keys[current_arms_index]
	var legs_key: String = legs_keys[current_legs_index]
	var color_key: String = color_keys[current_color_index]
	
	# update character
	character.set_body_texture(Global.body_collection[body_key])
	character.set_eyes_texture(Global.eyes_collection[eyes_key])
	character.set_arms_texture(Global.arms_collection[arms_key])
	character.set_legs_texture(Global.legs_collection[legs_key])
	character.set_color(Global.body_colors[color_key])
	
	# update ui
	_update_selected_body_label(body_key)
	_update_selected_eyes_label(eyes_key)
	_update_selected_arms_label(arms_key)
	_update_selected_legs_label(legs_key)
	_update_selected_color_ui(color_key, character.body_color.color)
	
	# handle name
	var random_name: String = Global.random_names[
		randi() % Global.random_names.size()
	]
	$NamePanel/HBoxContainer/NameInput.text = random_name
	_on_name_input_text_changed(random_name)
	
	
func _update_selected_body_label(text: String) -> void:
	$BodyPanel/VBoxContainer/HBoxContainer/BodySelectedLabel.text = text
	
	
func _update_selected_eyes_label(text: String) -> void:
	$EyesPanel/VBoxContainer/HBoxContainer/EyesSelectedLabel.text = text
	
	
func _update_selected_arms_label(text: String) -> void:
	$ArmsPanel/VBoxContainer/HBoxContainer/ArmsSelectedLabel.text = text
	
	
func _update_selected_legs_label(text: String) -> void:
	$LegsPanel/VBoxContainer/HBoxContainer/LegsSelectedLabel.text = text
	

func _update_selected_color_ui(text: String, color: Color) -> void:
	$ColorPanel/VBoxContainer/ColorSelectedLabel.text = text
	$ColorPanel/VBoxContainer/HBoxContainer/ColorSelected.color = color

func _on_name_input_text_changed(new_name: String) -> void:
	new_name = _clean_character_name(new_name)
	
	if new_name.length() > MAX_NAME_LENGTH:
		new_name = new_name.substr(0, MAX_NAME_LENGTH)
		$NamePanel/HBoxContainer/NameInput.text = new_name
		$NamePanel/HBoxContainer/NameInput.caret_column = MAX_NAME_LENGTH
		
	character.set_character_name(new_name)
	
	if character.character_name.length() > 0:
		$CreatePanel/CreateButton.disabled = false
	else:
		$CreatePanel/CreateButton.disabled = true


func _clean_character_name(text: String) -> String:
	var regex = RegEx.new()
	regex.compile("[^a-zA-Z]")
	return regex.sub(text, "", true).to_lower()


func _on_create_button_pressed() -> void:
	pass # Replace with function body.
