extends Node2D
# GameMode Scripti

var oyuncuSayisi = 10  # Dinamik oyuncu sayısı
var oyuncuRolleri = []  # Roller
var oyuncular = []  # Oyuncu listesi

# Oyuncu sahnesini preload edelim
@onready var OyuncuScene = preload("res://Sceens/oyuncu.tscn")

# Roller atama fonksiyonu
func oyuncuRollerini_ata():
	# Oyuncu rollerini belirle
	if oyuncuSayisi == 5:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "fasist", "hitler"]
	if oyuncuSayisi == 6:
		oyuncuRolleri = ["liberal", "liberal", "liberal","liberal", "fasist", "hitler"]
	if oyuncuSayisi == 7:
		oyuncuRolleri = ["liberal", "liberal", "liberal","liberal","fasist", "fasist", "hitler"]
	if oyuncuSayisi == 8:
		oyuncuRolleri = ["liberal", "liberal", "liberal","liberal","liberal","fasist", "fasist", "hitler"]
	if oyuncuSayisi == 9:
		oyuncuRolleri = ["liberal", "liberal", "liberal","liberal","liberal","fasist", "fasist", "fasist", "hitler"]
	if oyuncuSayisi == 10:
		oyuncuRolleri = ["liberal", "liberal", "liberal","liberal","liberal","liberal", "fasist", "fasist", "fasist", "hitler"]
	# Daha fazla oyuncu sayısı için diğer roller
	oyuncuRolleri.shuffle()

	# Oyuncular oluşturuluyor
	for i in range(oyuncuSayisi):
		# Oyuncu sahnesinden yeni bir instance oluştur
		var oyuncu_instance = OyuncuScene.instantiate()
		var rol = oyuncuRolleri[i]
		var parti = "liberal" if rol == "liberal" else "fasist"

		# Oyuncunun bilgilerini ayarla
		oyuncu_instance.bilgileri_ayarla(rol, parti)

		# Oyuncu instance'ını listeye ekle
		oyuncular.append(oyuncu_instance)
	
	print("Roller başarıyla atandı: ")

# Oyuncu listesini döndürür
func get_oyuncular():
	return oyuncular
