extends Node2D

@onready var cardGrubu = $Cardlar
var konum = Vector2(150,150)
func _input(event):
	if event.is_action_pressed("Up"):
		konum.x += 100
		_objeOlustur("res://Sceens/card.tscn",konum, cardGrubu)

func _objeOlustur(objeYol, pos, child):
	var obje = load(objeYol).instantiate()
	obje.position = pos
	child.add_child(obje)
