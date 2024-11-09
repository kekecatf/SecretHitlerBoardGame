extends Area2D

@onready var sprite = $Sprite2D
var hedef_konum = Vector2(500, 300)  # Kartın gitmesini istediğiniz sabit hedef konum
var hedefe_gitti = true  
var is_original = true  # Orijinal kartı işaretlemek için değişken

var politikalar = ["liberal politika","liberal politika","liberal politika",
"liberal politika","liberal politika","liberal politika",
"fasist politika","fasist politika","fasist politika","fasist politika",
"fasist politika","fasist politika","fasist politika","fasist politika","fasist politika","fasist politika","fasist politika"]

# Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Politika Karti tıklandı")
		
		if hedefe_gitti and is_original:
			# Sadece orijinal kart için Tween nesnesi oluşturuyoruz
			var tween = create_tween()
			tween.connect("finished", Callable(self, "_on_tween_finished"))
			
			# Hedef konuma hareket ve ölçek ayarı
			tween.tween_property(self, "position", hedef_konum, 1)
			tween.tween_property(self, "scale", Vector2(0.2, 0.2), 1)

			# Hedefe gitme durumunu tersine çeviriyoruz
			hedefe_gitti = !hedefe_gitti  

# Tween tamamlandığında çağrılacak fonksiyon
func _on_tween_finished():
	if is_original:
		# Orijinal kart hedefe ulaştığında iki kopya oluştur
		for i in range(2):
			var new_kart = self.duplicate()  # Kartın kopyasını oluştur
			new_kart.position = hedef_konum + Vector2((i + 1) * 150, 0)  # Yan yana dizmek için pozisyonu ayarla
			var texture_path = "res://SecretHitlerAsset/Politikalar/PolitikalarFasist.png"
			var texture = load(texture_path)
			sprite.texture = texture  # Texture'yi TouchScreenButton'a ata
			
			# Yeni kartların `is_original` değeri `false` olarak ayarlanır
			new_kart.is_original = false  
			
			get_parent().add_child(new_kart)  # Yeni kartları sahneye ekle
