extends Area2D

@onready var sprite = $Sprite2D
var degisken = 3
var son_pozisyon = Vector2()
var game_mode = null  # GameMode referansı
var oyuncu_id
var rotasyon = [0, 90, 90, -90, -90]

# GameMode'u ayarlama fonksiyonu
func set_game_mode(mode):
	game_mode = mode

# Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		kart_tiklandi()

func kart_tiklandi():
	print("zarf tıklandı!", oyuncu_id + 1)

	son_pozisyon = position
	queue_free()  # Zarfı sahneden kaldır

	var oyuncu_rolu = GameManager.game_mode.oyuncuRolleri[oyuncu_id]
	
	# Kartları oluştur ve sahneye ekle
	create_card("rol", oyuncu_rolu, oyuncu_id, Vector2(0, 0))
	create_card("parti", null, oyuncu_id, Vector2(70, 0) if oyuncu_id == 0 else Vector2(0, 70))
	create_card("oylama_evet", null, oyuncu_id, Vector2(140, 0) if oyuncu_id == 0 else Vector2(0, 140))
	create_card("oylama_hayir", null, oyuncu_id, Vector2(140, 0) if oyuncu_id == 0 else Vector2(0, 140))

# Kart oluşturma fonksiyonu
func create_card(card_type, oyuncu_rolu, oyuncu_id, offset):
	var card = load("res://Sceens/cart.tscn").instantiate()
	card.position = son_pozisyon + offset
	card.scale = Vector2(0.08, 0.08)
	card.rotation_degrees = rotasyon[oyuncu_id]

	match card_type:
		"rol":
			card._rolKartiniAl(oyuncu_rolu, oyuncu_id)
		"parti":
			card._partiKartiniAl(oyuncu_rolu, oyuncu_id)
		"oylama_evet":
			card._oylamaKartiEvetAl(oyuncu_id)
		"oylama_hayir":
			card._oylamaKartiHayirAl(oyuncu_id)

	get_parent().add_child(card)
