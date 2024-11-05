extends Node2D

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")  # GameMode sahnesini yükle
var GameMode = null  # GameMode referansı

var liberal_yasa:int
var fasist_yasa:int

var baskanlik:int
var eskiBaskanlik:int
var sansolyelik:int
var eskiSansolyelik:int
var Hitler:int 
var konum = [Vector2(500,550), Vector2(300,100), Vector2(500,100), Vector2(700,100),Vector2(900,100), Vector2(100,300)]

func _ready():
	GameMode = GameModeNode.instantiate()  # GameMode sahnesinden bir örnek oluştur
	add_child(GameMode)  # GameMode'u sahneye ekle
	GameManager.game_mode = GameMode  # Singleton'a GameMode referansı atanıyor
	
	for i in range(GameManager.game_mode.oyuncuSayisi):
		var button = load("res://Sceens/button.tscn").instantiate()
		button.position = konum[i]
		button.scale = Vector2(0.13, 0.13)
		button.oyuncu_id = i  # Zarfın hangi oyuncuya ait olduğunu belirtiyoruz
		add_child(button)
		
	GameMode.oyuncuRollerini_ata()
	Hitler = GameMode.hitler
	print("Hitler= ",GameMode.hitler + 1)
	
	#GameMode.olmek(2)
	
	randomize()  # Rastgele sayı üreteciyi başlat
	baskanlik = randi_range(0, GameMode.oyuncuSayisi -1)  # 1 ile 10 arasında rastgele bir sayı
	print("İlk Başkan = ",baskanlik+1)


func _process(delta):
	#Oyunu bitirme koşulları
	if (fasist_yasa >= 4 and sansolyelik == Hitler) or (fasist_yasa == 6):
		GameMode.fasistZaferi()
	elif (liberal_yasa == 6):
		GameMode.liberalZaferi()
