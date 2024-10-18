extends Node2D
#Oyuncu.gd

# Oyuncunun bilgileri
var rol = ""
var parti_uyeligi = ""
var baskan = false
var sansolye = false
var ana_oyuncumu = false

# Oyuncunun bilgilerini ayarlayan bir fonksiyon
func bilgileri_ayarla(rol_bilgisi, parti_bilgisi):
	rol = rol_bilgisi
	parti_uyeligi = parti_bilgisi
	print("Oyuncu rolü: ",rol," "," parti üyeliği: ",parti_uyeligi)
