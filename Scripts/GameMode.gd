extends Node2D
#GameMode.gd

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

	# Oyuncuları dinamik olarak oluştur ve AnaSahne'ye ekle
	for i in range(oyuncuSayisi):
		var oyuncu_scene = load("res://Sceens/oyuncu.tscn").instantiate()
		add_child(oyuncu_scene)  # Oyuncuyu sahneye ekleyin
		
		var rol_bilgisi = oyuncuRolleri[i]
		var parti_bilgisi = "Liberal Parti" if rol_bilgisi == "liberal" else "Fasist Parti"

		
		# Oyuncunun bilgilerini ayarlayın
		oyuncu_scene.bilgileri_ayarla(rol_bilgisi, parti_bilgisi)
		
		# Oyuncuyu listeye ekleyin
		oyuncular.append(oyuncu_scene)
		
		print("Oyuncu ", i + 1, " rolü: ", rol_bilgisi, ", parti üyeliği: ", parti_bilgisi)
