extends Node2D
#cart sahnesi

@onready var sprite = $Sprite2D
@export var asset_name: String  # Kartın asset'ini tutar
var role = ""  # Oyuncu rolünü saklar

func set_role(rol):
	role = rol
	match role:
		"liberal":
			sprite.texture = load("res://SecretHitlerAsset/OyuncuRolleri/RollerLib.png")
		"fasist":
			sprite.texture = load("res://SecretHitlerAsset/OyuncuRolleri/RollerFas.png")
		"hitler":
			sprite.texture = load("res://SecretHitlerAsset/OyuncuRolleri/RollerHit.png")
		_:
			print("Bilinmeyen rol:", role)
