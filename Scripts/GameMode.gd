extends Node2D

var oyuncuSayisi
var rng = RandomNumberGenerator.new()
var roller = ["liberal","fasist","hitler"]
var rolSayi
var rol

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	rolSayi = rng.randi_range(0,3)
	if rolSayi == 1:
		rol = roller[0]
		print(rol)
	if rolSayi == 2:
		rol = roller[1]
		print(rol)
	if rolSayi == 3:
		rol = roller[2]
		print(rol)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
