extends Area2D

@onready var sprite = $Sprite2D
var degisken = 3
var son_pozisyon = Vector2()
var game_mode = null  # GameMode referansı
var oyuncu_id 
var rotasyon = [0,90,90,-90,-90]

# GameMode'u ayarlama fonksiyonu
func set_game_mode(mode):
	game_mode = mode


#Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			kart_tiklandi()

func kart_tiklandi():
	print("zarf tıklandı!", oyuncu_id +1)
	
	son_pozisyon = self.position
	queue_free()  # Zarfı sahneden kaldır

	var oyuncu_id = self.oyuncu_id  # Tıklanan zarfın oyuncu_id'sini alın
	var oyuncu_rolu = GameManager.game_mode.oyuncuRolleri[oyuncu_id]  # İlgili oyuncunun rolü

	# Rol kartını oluşturur
	var rol_kart = load("res://Sceens/cart.tscn").instantiate()
	rol_kart.position = son_pozisyon
	rol_kart.scale = Vector2(0.08, 0.08)
	rol_kart.rotation_degrees = rotasyon[oyuncu_id]
	rol_kart._rolKartiniAl(oyuncu_rolu,oyuncu_id)  # Rolü atayın

	# Parti kartını oluşturur
	var parti_kart = load("res://Sceens/cart.tscn").instantiate()
	if oyuncu_id == 0:
		parti_kart.position = son_pozisyon + Vector2(70,0)  # Mesafeyi ayarlayın (100 px sağa kaydırdık)
	else:
		parti_kart.position = son_pozisyon + Vector2(0,70)  # Mesafeyi ayarlayın (100 px sağa kaydırdık)
	parti_kart.scale = Vector2(0.08, 0.08)
	parti_kart.rotation_degrees = rotasyon[oyuncu_id]
	parti_kart._partiKartiniAl(oyuncu_rolu,oyuncu_id)  # Parti üyeliğini atayın
	
	# Oylama evet kartını oluştur
	var oylama_evet_karti = load("res://Sceens/cart.tscn").instantiate()
	if oyuncu_id == 0:
		oylama_evet_karti.position = son_pozisyon + Vector2(140,0)
	else:
		oylama_evet_karti.position = son_pozisyon + Vector2(0,140)
	oylama_evet_karti.scale = Vector2(0.08,0.08)
	oylama_evet_karti.rotation_degrees = rotasyon[oyuncu_id]
	oylama_evet_karti._oylamaKartiEvetAl(oyuncu_id)

	# Oylama hayir kartını oluştur
	var oylama_hayir_karti = load("res://Sceens/cart.tscn").instantiate()
	if oyuncu_id == 0:
		oylama_hayir_karti.position = son_pozisyon + Vector2(140,0)
	else:
		oylama_hayir_karti.position = son_pozisyon + Vector2(0,140)
	oylama_hayir_karti.scale = Vector2(0.08,0.08)
	oylama_hayir_karti.rotation_degrees = rotasyon[oyuncu_id]
	oylama_hayir_karti._oylamaKartiHayirAl(oyuncu_id)

	# Kartları sahneye ekle
	get_parent().add_child(rol_kart)
	get_parent().add_child(parti_kart)
	get_parent().add_child(oylama_evet_karti)
	get_parent().add_child(oylama_hayir_karti)
