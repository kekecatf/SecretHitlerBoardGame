extends Area2D

@onready var sprite = $Sprite2D
var degisken = 3
var son_pozisyon = Vector2()

func _ready():
	pass
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
			sprite.texture = texture
	else:
		son_pozisyon = self.position
		queue_free()  # Zarfı sahneden kaldır
		for i in range(2):
			var kart = load("res://Sceens/cart.tscn").instantiate()
			kart.position = son_pozisyon + Vector2(i * 70, 0)
			kart.scale = Vector2(0.08,0.08)
			# Kartın sprite'ını değiştirin
			if degisken == 3:
				kart.asset_name = "Oylar/OylarEvet.png"
				print("Degısken 3 ")
			else:
				kart.asset_name = "Oylar/OylarHayir.png"
				print("degısken 3 degıl")
			
			get_parent().add_child(kart)

func kartlari_dagit():
	pass
