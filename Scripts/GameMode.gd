extends Node2D

var oyuncuSayisi = 10
var oyuncuRolleri = []

func _ready():

	# Oyuncu sayısına göre rollerin sayısı
	if oyuncuSayisi == 5:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "fasist", "hitler"]
	elif oyuncuSayisi == 6:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "liberal", "fasist", "hitler"]
	elif oyuncuSayisi == 7:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "hitler"]
	elif oyuncuSayisi == 8:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "hitler"]
	elif oyuncuSayisi == 9:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "fasist", "hitler"]
	elif oyuncuSayisi == 10:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "fasist", "hitler"]
	else:
		print("Geçersiz oyuncu sayısı!")

	# Rolleri karıştırın
	oyuncuRolleri.shuffle()

	# Oyunculara roller atandı
	for i in range(oyuncuSayisi):
		print("Oyuncu ", i + 1, " rolü: ", oyuncuRolleri[i])

func _process(delta):
	pass
