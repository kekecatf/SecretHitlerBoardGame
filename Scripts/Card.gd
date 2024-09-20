extends Node2D
# Card Scripti

@onready var button = $TouchScreenButton # TouchScreenButton'u yakala
@export var asset_name: String  # Kartın asset'ini tutar

var is_dragging = false  # Kartın sürüklenip sürüklenmediğini takip eder
var start_position = Vector2()  # Fare/dokunma başlangıç pozisyonu
var drag_offset = Vector2()  # Sürükleme başlangıcındaki ofset

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
	# Kart basıldığında sürüklemeyi başlat
	is_dragging = true
	drag_offset = get_global_mouse_position() - position  # Sürükleme sırasında ofseti hesapla

func _on_card_released():
	is_dragging = false  # Sürüklemeyi bırak

func drag_card(event):
	# Kartın yeni pozisyonunu hesapla
	var new_position = get_global_mouse_position() - drag_offset

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
