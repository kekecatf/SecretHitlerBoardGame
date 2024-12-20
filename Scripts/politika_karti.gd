extends Area2D

@onready var sprite = $Sprite2D
var ana_sahne = load("res://Sceens/ana_sahne.tscn")
var hedef_konum = Vector2(500, 300)  # Kartın gitmesini istediğiniz sabit hedef konum
var is_original = true  # Orijinal kartı işaretlemek için değişken
var sansolye_ornek_konum = Vector2(500,50)
var is_tweening = false  # Hareket sırasında tıklamayı devre dışı bırakacak bayrak
var politikalar = ["liberal politika", "liberal politika", "liberal politika",
"liberal politika", "liberal politika", "liberal politika",
"fasist politika", "fasist politika", "fasist politika", "fasist politika",
"fasist politika", "fasist politika", "fasist politika", "fasist politika", 
"fasist politika", "fasist politika", "fasist politika"]

var asset_paths = {
	"liberal politika": "res://SecretHitlerAsset/Politikalar/PolitikalarLiberal.png",
	"fasist politika": "res://SecretHitlerAsset/Politikalar/PolitikalarFasist.png"
}

func _ready():
	politikalar.shuffle()

# Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	# Kart seçildiyse başka kartların etkileşim almasını engelle
	if is_tweening:
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("politika karti tiklandi")
		
		#desteden kart çekme
		if position == Vector2(250, 230) and GameManager.kartlar_ortaya_geldimi == false and GameManager.sansolyeye_verilecek_kart_secildimi == false:
			# Sadece orijinal kart için Tween nesnesi oluşturuyoruz
			var tween = create_tween()
			tween.connect("finished", Callable(self, "_on_tween_finished"))
			
			# Hedef konuma hareket ve ölçek ayarı
			tween.tween_property(self, "position", hedef_konum, 1)
			tween.tween_property(self, "scale", Vector2(0.2, 0.2), 1)
			is_tweening = true  # Tween işlemi başlatılıyor
			
		#atmak istenilen kartı seçme
		elif position != Vector2(500,50) and GameManager.atilacak_kart_secildimi == false and GameManager.sansolyeye_verilecek_kart_secildimi == false and GameManager.kartlar_ortaya_geldimi == true:
			if is_tweening:  # Eğer tween işlemi devam ediyorsa tıklama işlevini iptal et
				return
			# Tıklanan kartın görselini güncellemek için yeni bir görsel yol belirleyin
			var yeni_gorsel = "res://SecretHitlerAsset/Politikalar/PolitikaArka.png"  # Yeni sprite yolu
			sprite.texture = load(yeni_gorsel)
			# Kartın yeni konuma gitmesini sağla
			var yeni_konum = Vector2(846, 230)  # Belirlediğiniz yeni konum
			var tween = create_tween()
			tween.tween_property(self, "position", yeni_konum, 1)
			tween.tween_property(self, "scale", Vector2(0.08, 0.08), 1)
			is_tweening = true  # Tween işlemi başlatılıyor
			tween.connect("finished", Callable(self, "_on_tween_finished_atilacak_kart"))
			GameManager.atilacak_kart_secildimi = true  # Kart seçildi olarak işaretleniyor
		
		#kartları şansolyeye verme
		elif GameManager.atilacak_kart_secildimi == true and GameManager.sansolyeye_verilecek_kart_secildimi == false and GameManager.kartlar_ortaya_geldimi == true:
			# Tıklanan kartın görselini güncellemek için yeni bir görsel yol belirleyin
			var yeni_gorsel = "res://SecretHitlerAsset/Politikalar/PolitikaArka.png"  # Yeni sprite yolu
			sprite.texture = load(yeni_gorsel)
			# Kartın yeni konuma gitmesini sağla
			var yeni_konum = sansolye_ornek_konum  # Belirlediğiniz yeni konum
			var tween = create_tween()
			tween.tween_property(self, "position", yeni_konum, 1)
			tween.tween_property(self, "scale", Vector2(0.08, 0.08), 1)
			GameManager.sansolyeye_verilecek_kart_kontrolu()

# Tween tamamlandığında çağrılacak fonksiyon
func _on_tween_finished():
	is_tweening = false  # Tween işlemi bitti, tıklama yeniden aktif
	queue_free()

	# Üstteki 3 kartı çek ve göster
	for i in range(3):
		var kart_turu = politikalar.pop_front()  # En üstteki kartı çek
		var kart_gorsel_yolu = asset_paths[kart_turu]  # Kartın görsel yolunu al
		# Yeni bir kart nesnesi oluştur
		var new_kart = self.duplicate()
		new_kart.is_original = false  # Kopyaların orijinal olmadığını belirtiyoruz
		new_kart.position = hedef_konum + Vector2((i) * 150, 0)  # Konumu ayarla

		# Sprite'ın görselini güncelle
		new_kart.get_node("Sprite2D").texture = load(kart_gorsel_yolu)
		
		get_parent().add_child(new_kart)  # Kartı sahneye ekle
		GameManager.kartlar_ortaya_geldimi = true

# Tween tamamlandığında çağrılacak yeni fonksiyon
func _on_tween_finished_atilacak_kart():
	is_tweening = false  # Tween işlemi bitti, tıklama yeniden aktif
