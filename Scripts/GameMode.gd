extends Node2D
#GameMode Scripti

var oyuncuSayisi = 5  # Test için başlangıç değeri, bunu dinamik olarak ayarlayabilirsiniz.
var rng = RandomNumberGenerator.new()
var oyuncuRolleri = []
var oyuncuKartlar = []

# Oyuncuların bilgilerini tutmak için bir dizi
var oyuncular = []

func _ready():
	rng.randomize()

	# Oyuncu sayısına göre rollerin sayısını ayarlayın
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

	# Oyunculara rastgele kartlar atamak için kart seti (örnek olarak 3 kart)
	var kartSeti = ["kart1", "kart2", "kart3"]

	# Oyunculara roller ve kartlar atayın
	for i in range(oyuncuSayisi):
		var oyuncu = {
			"rol": oyuncuRolleri[i],
			"kart": kartSeti[rng.randi_range(0, kartSeti.size() - 1)]  # Rastgele bir kart seç
		}
		oyuncular.append(oyuncu)
		print("Oyuncu ", i + 1, " rolü: ", oyuncular[i].rol, ", kartı: ", oyuncular[i].kart)

func _process(delta):
	pass
