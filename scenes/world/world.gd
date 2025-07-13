extends Node2D

var player: CharacterBody2D

@onready var spawn = $PlayerSpawn


func _ready():
	if player:
		player.global_position = spawn.global_position
		player.scale = Vector2(1.0, 1.0)
		add_child(player)
