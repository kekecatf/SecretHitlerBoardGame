extends Node2D
#GameMode Scripti

var oyuncuSayisi = 5  # Dinamik oyuncu sayısı
var oyuncuRolleri = []  # Roller
var oyuncular = []  # Oyuncu listesi

# Roller atama fonksiyonu
func oyuncuRollerini_ata():
	# Oyuncu rollerini belirle
	if oyuncuSayisi == 5:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "fasist", "hitler"]
	# Daha fazla oyuncu sayısı için diğer roller
	oyuncuRolleri.shuffle()

	# Oyuncular oluşturuluyor
	for i in range(oyuncuSayisi):
		var oyuncu = { "rol": oyuncuRolleri[i], "parti": ("liberal" if oyuncuRolleri[i] == "liberal" else "fasist") }
		oyuncular.append(oyuncu)
	
	print("Roller başarıyla atandı: ", oyuncular)

# Oyuncu listesini döndürür
func get_oyuncular():
	return oyuncular
