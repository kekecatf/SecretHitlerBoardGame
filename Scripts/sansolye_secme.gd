extends Area2D

var is_dragging = false

#Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("sansolye sec tiklandi")

func _input(event):
	# Sürüklemeye başlama
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_global_mouse_position().distance_to(global_position) < 50: # Fare tıklamasının cisme yakınlığı
			is_dragging = true

	# Sürükleme sırasında nesneyi fare pozisyonuna taşıma
	elif event is InputEventMouseMotion and is_dragging:
		global_position = get_global_mouse_position()

	# Fare bırakıldığında sürüklemeyi durdurma
	elif event is InputEventMouseButton and not event.pressed:
		if is_dragging:
			is_dragging = false
			# Hedef alanın konumunu kontrol etme
			if get_parent().get_node("TargetArea").global_position.distance_to(global_position) < 50:
				print("Cisim hedef alana bırakıldı!")  # İstediğiniz çıktıyı burada alabilirsiniz
