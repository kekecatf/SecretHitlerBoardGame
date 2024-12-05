extends Area2D

var is_dragging = false  # Sürüklenme durumunu takip eder
var offset = Vector2()   # Farenin tıklama pozisyonuna göre nesneye olan mesafe
var oyuncu_alanlari = [
	Rect2(Vector2(50, 3), Vector2(130, 130)),  # Oyuncu 1'in alanı
	Rect2(Vector2(600, 320), Vector2(130, 130)),  # Oyuncu 2'nin alanı
	Rect2(Vector2(400, 200), Vector2(130, 130)),  # Oyuncu 3'ün alanı
	Rect2(Vector2(200, 400), Vector2(130, 130)),  # Oyuncu 4'ün alanı
	Rect2(Vector2(100, 600), Vector2(130, 130)),  # Oyuncu 5'in alanı
	Rect2(Vector2(830, 600), Vector2(130, 130)),  # Oyuncu 6'nın alanı
	Rect2(Vector2(1050, 320), Vector2(130, 130)), # Oyuncu 7'nin alanı
	Rect2(Vector2(1250, 400), Vector2(130, 130)), # Oyuncu 8'in alanı
	Rect2(Vector2(1400, 500), Vector2(130, 130)), # Oyuncu 9'un alanı
	Rect2(Vector2(1600, 700), Vector2(130, 130))  # Oyuncu 10'un alanı
]


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
				_hedef_alan_kontrol()

func _process(delta):
	if is_dragging:
		# Fareyi takip ederek nesneyi hareket ettir
		global_position = get_global_mouse_position() + offset

# Hedef alanı kontrol eden fonksiyon
func _hedef_alan_kontrol():
	for i in range(oyuncu_alanlari.size()):
		if oyuncu_alanlari[i].has_point(global_position):
			print("Nesne Oyuncu %d'nin alanında!" % (i + 1))
			return
	print("Nesne hiçbir oyuncu alanına bırakılmadı!")
