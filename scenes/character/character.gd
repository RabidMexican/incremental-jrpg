extends CharacterBody2D
class_name Character

@export var movable: bool = false
@export var show_name: bool = false
@export var speed: int = 50
@export var character_name: String = Global.random_names[0]

@onready var body: Sprite2D = $Skeleton/Body/BodyTexture
@onready var body_color: ColorRect = $Skeleton/Body/ColorRect
@onready var eyes: Sprite2D = $Skeleton/Eyes
@onready var arms: Sprite2D = $Skeleton/Arms
@onready var legs: Sprite2D = $Skeleton/Legs
@onready var name_tag: Label = $Skeleton/Label

var last_direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	if show_name:
		name_tag.visible = true
	else:
		name_tag.visible = false

func set_body_texture(new_texture: Texture2D) -> void:
	body.texture = new_texture
	
	
func set_eyes_texture(new_texure: Texture2D) -> void:
	eyes.texture = new_texure
	
	
func set_arms_texture(new_texure: Texture2D) -> void:
	arms.texture = new_texure
	
	
func set_legs_texture(new_texure: Texture2D) -> void:
	legs.texture = new_texure
	
	
func set_color(new_color: Color) -> void:
	body_color.color = new_color


func set_character_name(new_name: String) -> void:
	character_name = new_name
	name_tag.text = new_name
	
	
func _physics_process(delta: float) -> void:
	if movable:
		var direction = Vector2.ZERO
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		
		# check for direction updatessadasdawdaa
		if direction != last_direction:
			last_direction = direction
		
		# update x velocity
		if direction.x != 0:
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed * delta)
		
		# update y velocity
		if direction.y != 0:
			velocity.y = direction.y * speed
		else:
			velocity.y = move_toward(velocity.y, 0, speed * delta)

		move_and_slide()
