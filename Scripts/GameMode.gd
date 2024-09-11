extends Node2D

var oyuncuSayisi = 5  # Oyuncu sayısını dinamik olarak ayarlayabilirsiniz
var rng = RandomNumberGenerator.new()
var oyuncuRolleri = []

func _ready():
	rng.randomize()

	# Oyuncu sayısına göre rollerin sayısını ayarlayın
	oyuncuRolleri = _rolDagitim(oyuncuSayisi)
	
	# Rolleri karıştırın
	oyuncuRolleri.shuffle()

func _rolDagitim(oyuncu_sayisi):
	if oyuncu_sayisi == 5:
		return ["liberal", "liberal", "liberal", "fasist", "hitler"]
	elif oyuncu_sayisi == 6:
		return ["liberal", "liberal", "liberal", "liberal", "fasist", "hitler"]
	elif oyuncu_sayisi == 7:
		return ["liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "hitler"]
	elif oyuncu_sayisi == 8:
		return ["liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "hitler"]
	elif oyuncu_sayisi == 9:
		return ["liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "fasist", "hitler"]
	elif oyuncu_sayisi == 10:
		return ["liberal", "liberal", "liberal", "liberal", "liberal", "liberal", "fasist", "fasist", "fasist", "hitler"]
	else:
		print("Geçersiz oyuncu sayısı!")
		return []
