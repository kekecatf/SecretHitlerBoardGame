extends Area2D

# Sürükleme kontrolü için değişkenler
var is_dragging = false
var offset = Vector2()

# Oyuncu alanlarının tanımı
var oyuncu_alanlari = [
	Rect2(Vector2(500, 500), Vector2(600, 600)),  # Oyuncu 1'in alanı
	Rect2(Vector2(60, 50), Vector2(160, 150)),    # Oyuncu 2'nin alanı
	Rect2(Vector2(60, 200), Vector2(160, 300)),   # Oyuncu 3'ün alanı
	Rect2(Vector2(950, 50), Vector2(1050, 150)),   # Oyuncu 4'ün alanı
	Rect2(Vector2(950, 200), Vector2(1050, 300)),  # Oyuncu 5'in alanı
	Rect2(Vector2(830, 600), Vector2(130, 135)),  # Oyuncu 6'nın alanı
	Rect2(Vector2(1050, 320), Vector2(130, 135)), # Oyuncu 7'nin alanı
	Rect2(Vector2(1250, 400), Vector2(130, 130)), # Oyuncu 8'in alanı
	Rect2(Vector2(1400, 500), Vector2(130, 130)), # Oyuncu 9'un alanı
	Rect2(Vector2(1600, 700), Vector2(130, 130))  # Oyuncu 10'un alanı
]

# Sürükleme işlemi
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
	for i in range(oyuncu_alanlari.size()):
		if oyuncu_alanlari[i].has_point(global_position):
			print("Nesne Oyuncu %d'nin alanına bırakıldı!" % (i + 1))
			islem_oyuncu_alanina_gore(i + 1)
			return
	print("Geçerli bir alana bırakılmadı.")

# Oyuncu alanına göre işlem yapma
func islem_oyuncu_alanina_gore(oyuncu_no):
	match oyuncu_no:
		1:
			print("Oyuncu 1 için özel işlem yapılıyor!")
			# Buraya oyuncu 1 için yapılacak işlemi ekleyin
		2:
			print("Oyuncu 2 için özel işlem yapılıyor!")
			# Buraya oyuncu 2 için yapılacak işlemi ekleyin
		3:
			print("Oyuncu 3 için özel işlem yapılıyor!")
			# Buraya oyuncu 3 için yapılacak işlemi ekleyin
		# Diğer oyuncular için devam edin
		_:
			print("Bu oyuncu için henüz işlem tanımlanmamış.")
