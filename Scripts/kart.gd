extends Area2D

@onready var sprite = $Sprite2D

func _ready():
	# Kartı hazırla, örneğin Sprite ekleyebilirsin
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			kart_tiklandi()

func kart_tiklandi():
	print("Kart tıklandı! İstediğin işlemi burada yap.")
