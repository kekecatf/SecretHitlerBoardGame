extends Node2D

@onready var CardSceene = "res://Sceens/card.tscn"
@onready var CardlarNode = $Cardlar
var position1 = Vector2(512,536)
var position2 = Vector2(112,328)
var position3 = Vector2(512,128)
var position4 = Vector2(1000,312)

func _ready():
	# GameMode sahnesini yükleyin ve bir örneğini oluşturun
	var game_mode_scene = load("res://Sceens/game_mode.tscn")
	var game_mode_instance = game_mode_scene.instantiate()
	
	# GameMode sahnesini ana sahneye ekleyin
	add_child(game_mode_instance)
	
	# Mevcut kart oluşturma kodları
	_objeOlustur(CardSceene, position1, 0, CardlarNode)
	_objeOlustur(CardSceene, position2, 110, CardlarNode)
	_objeOlustur(CardSceene, position3, -180, CardlarNode)
	_objeOlustur(CardSceene, position4, -270, CardlarNode)

func _objeOlustur(objeYol, pos, rot, child):
	var obje = load(objeYol).instantiate()
	obje.position = pos
	obje.rotation = rot
	child.add_child(obje)
