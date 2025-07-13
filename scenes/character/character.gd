extends CharacterBody2D
class_name Character


@export var movable: bool = false
@export var show_name: bool = false
@export var speed: int = 50
@export var character_name: String = Global.random_names[0]
@export var color: Color = Global.body_colors["Normal"]
@export var body: Texture2D = Global.body_collection["01"]
@export var eyes: Texture2D = Global.eyes_collection["01"]
@export var arms: Texture2D = Global.arms_collection["01"]
@export var legs: Texture2D = Global.legs_collection["01"]

var last_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	if show_name:
		$Skeleton/Label.visible = true
	else:
		$Skeleton/Label.visible = false

func set_body(new_body: Texture2D) -> void:
	body = new_body
	$Skeleton/Body/BodyTexture.texture = new_body
	
	
func set_eyes(new_eyes: Texture2D) -> void:
	eyes = new_eyes
	$Skeleton/Eyes.texture = new_eyes
	
	
func set_arms(new_arms: Texture2D) -> void:
	arms = new_arms
	$Skeleton/Arms.texture = new_arms
	
	
func set_legs(new_legs: Texture2D) -> void:
	legs = new_legs
	$Skeleton/Legs.texture = new_legs
	
	
func set_color(new_color: Color) -> void:
	color = new_color
	$Skeleton/Body/ColorRect.color = new_color


func set_character_name(new_name: String) -> void:
	character_name = new_name
	$Skeleton/Label.text = new_name
	
	
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
