extends Node2D
# Card Scripti

@onready var button = $TouchScreenButton # TouchScreenButton'u yakala
@export var asset_name: String  # Kartın asset'ini tutar

var is_dragging = false  # Kartın sürüklenip sürüklenmediğini takip eder
var start_position = Vector2()  # Fare/dokunma başlangıç pozisyonu

# Dikdörtgen sınırları
var rect_min = Vector2(350, 500)
var rect_max = Vector2(800, 630)

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
	
	# Tıklama sinyalini bağla
	button.connect("pressed", Callable(self, "_on_card_pressed"))
	button.connect("button_up", Callable(self, "_on_card_released"))

func _input(event):
	# Eğer sürükleme modundaysa ve fare hareket ediyorsa/dokunma varsa
	if is_dragging and event is InputEventScreenDrag:
		drag_card(event)

func _on_card_pressed():
	# Eğer kart pozisyonu belirtilen pozisyonlardan birindeyse sürüklemeyi başlat
	if position == Vector2(450, 550) or position == Vector2(500, 550) or position == Vector2(550, 550) or position == Vector2(600, 550):
		is_dragging = true
		start_position = position  # Mevcut pozisyonu başlangıç pozisyonu olarak ayarla
	else:
		is_dragging = false  # Sürükleme başlatılmaz


func _on_card_released():
	is_dragging = false  # Sürüklemeyi bırak

func drag_card(event):
	# Kartın yeni pozisyonunu hesapla
	var new_position = position + event.relative

	# Dikdörtgenin sınırlarını kontrol et
	if new_position.x < rect_min.x:
		new_position.x = rect_min.x
	elif new_position.x > rect_max.x:
		new_position.x = rect_max.x

	if new_position.y < rect_min.y:
		new_position.y = rect_min.y
	elif new_position.y > rect_max.y:
		new_position.y = rect_max.y

	# Kartı yeni pozisyona taşı
	position = new_position
