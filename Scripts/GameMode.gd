extends Node2D

var oyuncuSayisi = 5  # Test için başlangıç değeri, bunu dinamik olarak ayarlayabilirsiniz.
var rng = RandomNumberGenerator.new()
var oyuncuRolleri = []
var oyuncuKartlar = []

# Oyuncuların bilgilerini tutmak için bir dizi
var oyuncular = []
var current_president = null
var current_chancellor = null
var president_index = 0

var president_checked_membership = []
var laws = {"liberal": 0, "fascist": 0}

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

	start_game()

func start_game():
	president_index = rng.randi_range(0, oyuncular.size() - 1)  # Rastgele bir başkan seç
	current_president = oyuncular[president_index]
	select_chancellor()

# Başkan şansölye seçer
func select_chancellor():
	# Başkan, şansölye seçimi yapar
	# Şansölye seçimini oylamaya sunar
	var potential_chancellor = oyuncular[rng.randi_range(0, oyuncular.size() - 1)]
	while potential_chancellor == current_president:
		potential_chancellor = oyuncular[rng.randi_range(0, oyuncular.size() - 1)]
	
	vote_for_chancellor(potential_chancellor)

# Şansölye oylaması
func vote_for_chancellor(chancellor_candidate):
	var votes = []
	for oyuncu in oyuncular:
		votes.append(random_vote())  # Oyuncular rastgele oy veriyor
	
	var yes_votes = votes.count(true)
	if yes_votes > oyuncular.size() / 2:
		current_chancellor = chancellor_candidate
		process_laws()
	else:
		president_index = (president_index + 1) % oyuncular.size()
		current_president = oyuncular[president_index]
		select_chancellor()

# Kanun işlemleri
func process_laws():
	var drawn_laws = draw_laws()
	drawn_laws.remove_at(rng.randi_range(0, drawn_laws.size() - 1))  # Başkan bir kanunu atar
	
	var remaining_laws = drawn_laws
	remaining_laws.remove_at(rng.randi_range(0, remaining_laws.size() - 1))  # Şansölye bir kanunu atar
	
	var final_law = remaining_laws[0]
	apply_law(final_law)
	
	check_win_condition()

# Kanunu uygula
func apply_law(law):
	laws[law] += 1

# Oyun kazanma koşullarını kontrol et
func check_win_condition():
	if laws["liberal"] >= 5:
		print("Liberaller kazandı!")
	elif laws["fascist"] >= 6:
		print("Fasistler kazandı!")
	elif laws["fascist"] >= 3 and current_chancellor.rol == "hitler":
		print("Fasistler kazandı!")
	else:
		president_index = (president_index + 1) % oyuncular.size()
		current_president = oyuncular[president_index]
		select_chancellor()

# Rastgele oy üret
func random_vote():
	return rng.randi() % 2 == 0  # %50 şansla Evet veya Hayır

# Kanunları çek
func draw_laws():
	return ["liberal", "fascist", "fascist"]  # Rastgele üç kanun
