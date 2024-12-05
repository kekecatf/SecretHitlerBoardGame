extends Area2D

var is_dragging = false  # Sürüklenme durumunu takip eder
var offset = Vector2()   # Farenin tıklama pozisyonuna göre nesneye olan mesafe
var hedef_alan = Rect2(Vector2(830, 320), Vector2(960 - 830, 450 - 320))  # Hedef alan (dikdörtgen)

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
	if hedef_alan.has_point(global_position):
		print("Hedef alanın içine bırakıldı!")
	else:
		print("Hedef alanın dışında bırakıldı.")
