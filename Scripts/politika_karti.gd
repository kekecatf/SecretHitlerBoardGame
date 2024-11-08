extends Area2D

var hedef_konum = Vector2(500, 300)  # Sprite'ın gitmesini istediğiniz sabit hedef konum
var son_pozisyon = Vector2()  # Başlangıçta sprite'ın ilk konumu

# İlk tıklamada hedefe gitmesini sağlamak için başlangıç değeri "false"
var hedefe_gitti = false  

func _ready():
	# Başlangıç konumunu kaydediyoruz
	son_pozisyon = position  

# Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Politika kartı tıklandı")

		# Tween nesnesi oluşturuyoruz
		var tween = create_tween()

		# Hedefe gidip gitmediğini kontrol ederek hareketi ayarlıyoruz
		if hedefe_gitti:
			# Hedefteyse başlangıç konumuna geri döner
			tween.tween_property(self, "position", son_pozisyon, 1)
			tween.tween_property(self, "scale", Vector2(0.08, 0.08), 1)
		else:
			# Başlangıç konumundaysa hedef konuma gider
			tween.tween_property(self, "position", hedef_konum, 1)
			tween.tween_property(self, "scale", Vector2(0.2, 0.2), 1)

		# Hedefe gitme durumunu tersine çeviriyoruz
		hedefe_gitti = !hedefe_gitti  

		# Ölçeği ayarlıyoruz (isteğe bağlı olarak her iki durumda aynı olacak şekilde bırakabilirsiniz)
