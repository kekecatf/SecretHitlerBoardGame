extends Node2D

var oyuncuSayisi = 5
var Roller = []
var oyuncuRolleri = []
var oyuncuPartileri = []
var kartinaBakilabilirmi = []

var hitler:int


func oyuncuRollerini_ata():
	# Oyuncu rollerini belirle
	if oyuncuSayisi == 5:
		Roller = ["liberal", "liberal", "liberal", "fasist", "hitler"]
	if oyuncuSayisi == 6:
		Roller = ["liberal", "liberal", "liberal","liberal", "fasist", "hitler"]
	if oyuncuSayisi == 7:
		Roller = ["liberal", "liberal", "liberal","liberal","fasist", "fasist", "hitler"]
	if oyuncuSayisi == 8:
		Roller = ["liberal", "liberal", "liberal","liberal","liberal","fasist", "fasist", "hitler"]
	if oyuncuSayisi == 9:
		Roller = ["liberal", "liberal", "liberal","liberal","liberal","fasist", "fasist", "fasist", "hitler"]
	if oyuncuSayisi == 10:
		Roller = ["liberal", "liberal", "liberal","liberal","liberal","liberal", "fasist", "fasist", "fasist", "hitler"]
	# Oyuncu rollerini karıştırıp sırasıyla oyunculara atayacak
	Roller.shuffle()
	
	for i in range(oyuncuSayisi):
		oyuncuRolleri.append(Roller[i])
		kartinaBakilabilirmi.append(0)
		if oyuncuRolleri[i] == "liberal":
			oyuncuPartileri.append("liberal uyelik")
		elif oyuncuRolleri[i] == "fasist":
			oyuncuPartileri.append("fasist uyelik")
		elif oyuncuRolleri[i] == "hitler":
			hitler = i
			oyuncuPartileri.append("fasist uyelik")
			print("Hitler= ", hitler + 1)
		print([i+1],oyuncuRolleri[i],"  " ,oyuncuPartileri[i])
	
#if (liberal_yasa == 6)
func liberalZaferi():
	print("Liberaller Kazandi!")

#if (fasist_yasa >= 4 and sansolyelik == hitler) or (fasist_yasa == 6) 
func fasistZaferi():
	print("Fasistler Kazandi!")
	
	
func olmek(x):
	oyuncuRolleri.remove_at(x)
	oyuncuPartileri.remove_at(x)
	print(x + 1,"Oyuncusu öldü")
	print(oyuncuRolleri)
	
	if x == hitler:
		print("Hitler öldü")
		liberalZaferi()

#if kartinaBakabilirmi[x] == 0
func kartaBakma(x):
	kartinaBakilabilirmi[x] = 1
