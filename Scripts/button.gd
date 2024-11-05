extends Area2D

@onready var sprite = $Sprite2D
var degisken = 3
var son_pozisyon = Vector2()
var game_mode = null  # GameMode referansı
var oyuncu_id 

# GameMode'u ayarlama fonksiyonu
func set_game_mode(mode):
	game_mode = mode

func _ready():
	pass

#Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			kart_tiklandi()

func kart_tiklandi():
	print("Kart tıklandı!", oyuncu_id +1)
	
	## Zarf pozisyonunda olup olmadığını kontrol edin
	#if position == Vector2(500, 550):
		#print("oyuncunun kartina tıklandı")
		#var texture_path = "res://SecretHitlerAsset/Zarf/OyuncununZarf.png"
		#var texture = load(texture_path)
		#if texture:
			#sprite.texture = texture
	#else:
	son_pozisyon = self.position
	queue_free()  # Zarfı sahneden kaldır

	var oyuncu_id = self.oyuncu_id  # Tıklanan zarfın oyuncu_id'sini alın
	var oyuncu_rolu = GameManager.game_mode.oyuncuRolleri[oyuncu_id]  # İlgili oyuncunun rolü

	# Rol kartını oluştur
	var rol_kart = load("res://Sceens/cart.tscn").instantiate()
	rol_kart.position = son_pozisyon
	rol_kart.scale = Vector2(0.08, 0.08)
	rol_kart._rolKartiniAl(oyuncu_rolu)  # Rolü atayın

	# Parti kartını oluştur ve rol kartından biraz uzaklaştırarak konumlandır
	var parti_kart = load("res://Sceens/cart.tscn").instantiate()
	parti_kart.position = son_pozisyon + Vector2(100, 0)  # Mesafeyi ayarlayın (100 px sağa kaydırdık)
	parti_kart.scale = Vector2(0.08, 0.08)
	parti_kart._partiKartiniAl(oyuncu_rolu)  # Parti üyeliğini atayın

	# Kartları sahneye ekle
	get_parent().add_child(rol_kart)
	get_parent().add_child(parti_kart)




func kartlari_dagit():
	pass
