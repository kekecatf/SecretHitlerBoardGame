extends Area2D

var hedef_konum = Vector2(500, 300)  # Sprite'ın gitmesini istediğiniz sabit hedef konum

# İlk tıklamada hedefe gitmesini sağlamak için başlangıç değeri "false"
var hedefe_gitti = false  

# Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Politika kartı tıklandı")

		# Tween nesnesi oluşturuyoruz
		var tween = create_tween()
		tween.connect("finished", Callable(self, "_on_tween_finished"))
		tween.tween_property(self, "position", hedef_konum, 1)
		tween.tween_property(self, "scale", Vector2(0.2, 0.2), 1)

		# Hedefe gitme durumunu tersine çeviriyoruz
		hedefe_gitti = !hedefe_gitti  

		# Ölçeği ayarlıyoruz (isteğe bağlı olarak her iki durumda aynı olacak şekilde bırakabilirsiniz)
# Tween tamamlandığında çağrılacak fonksiyon
func _on_tween_finished():
	if hedefe_gitti:
		# Aynı karttan iki tane daha kopyala
		for i in range(2):
			var new_kart = self.duplicate()  # Kendini kopyala
			new_kart.position = hedef_konum + Vector2((i + 1) * 100, 0)  # Yan yana dizmek için pozisyonu ayarla
			get_parent().add_child(new_kart)  # Yeni kartları sahneye ekle
