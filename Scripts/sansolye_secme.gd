extends Area2D

# Sürükleme kontrolü için değişkenler
var is_dragging = false
var offset = Vector2()
# Oyuncu alanlarının tanımı
var oyuncu_alanlari = [
	Rect2(Vector2(500, 500), Vector2(605, 600)),  # Oyuncu 1'in alanı
	Rect2(Vector2(60, 50), Vector2(160, 155)),  # Oyuncu 2'nin alanı
	Rect2(Vector2(60, 160), Vector2(160, 265)),  # Oyuncu 3'ün alanı
	Rect2(Vector2(950, 50), Vector2(1050, 155)),  # Oyuncu 4'ün alanı
	Rect2(Vector2(950, 160), Vector2(1050, 265)),  # Oyuncu 5'in alanı
	Rect2(Vector2(830, 600), Vector2(130, 135)),  # Oyuncu 6'nın alanı
	Rect2(Vector2(1050, 320), Vector2(130, 135)), # Oyuncu 7'nin alanı
	Rect2(Vector2(1250, 400), Vector2(130, 130)), # Oyuncu 8'in alanı
	Rect2(Vector2(1400, 500), Vector2(130, 130)), # Oyuncu 9'un alanı
	Rect2(Vector2(1600, 700), Vector2(130, 130))  # Oyuncu 10'un alanı
]

#Surukleme islevi
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Sol tıklama başladı, sürükleme aktif
				is_dragging = true
				offset = global_position - get_global_mouse_position()
			else:
				# Sol tıklama bitti, sürükleme durdur ve hedef kontrolü yap
				is_dragging = false
				kontrol_alana_birakildi()
	elif event is InputEventMouseMotion and is_dragging:
		# Sürükleme sırasında alanı fare pozisyonuna göre güncelle
		global_position = get_global_mouse_position() + offset

# Belirlenen alanlarda olup olmadığını kontrol et
func kontrol_alana_birakildi():
	for alan in oyuncu_alanlari:
		if alan.has_point(global_position):
			print("Oyuncu alanına bırakıldı: ", alan)
			return
	print("Geçerli bir alana bırakılmadı.")
