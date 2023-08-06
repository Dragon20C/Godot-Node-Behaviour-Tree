extends CharacterBody2D

@export var MaxHealth : float
var CurrentHealth : float
@export var DamageRange : Array[float]
@export var MovementSpeed : float

func _ready() -> void:
	CurrentHealth = MaxHealth

func GetCurrentHealth() -> float:
	return CurrentHealth
