extends Area2D

@onready var sprite = $Sprite2D
var degisken = 3
var son_pozisyon = Vector2()
var game_mode = null  # GameMode referansı

# GameMode'u ayarlama fonksiyonu
func set_game_mode(mode):
	game_mode = mode

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
			var oyuncu_rolu = GameManager.game_mode.oyuncuRolleri[i]  # Örneğin, ilk oyuncunun rolü
			var oyuncu_parti = GameManager.game_mode.oyuncuPartileri[i]
			var kart = load("res://Sceens/cart.tscn").instantiate()
			kart.position = son_pozisyon + Vector2(i * 70, 0)
			kart.scale = Vector2(0.08, 0.08)
			
			# Kartın rolünü ayarlayın
			kart.set_role(oyuncu_rolu,oyuncu_parti)
			
			get_parent().add_child(kart)


func kartlari_dagit():
	pass
