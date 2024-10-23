extends Area2D

@onready var sprite = $Sprite2D
#var asset:String

func _ready():
	pass
	#sprite.texture = asset
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			kart_tiklandi()

func kart_tiklandi():
	print("Kart tıklandı!")
	if position == Vector2(500,550):
		print("oyuncunun kartina tıklandı")
		var texture_path = "res://SecretHitlerAsset/Zarf/OyuncununZarf.png"
		var texture = load(texture_path)
		if texture:
			sprite.texture = texture  # Texture'yi TouchScreenButton'a ata

func kartlari_dagit():
	pass
