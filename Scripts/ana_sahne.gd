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

func _ready():
	GameMode = GameModeNode.instantiate()  # GameMode sahnesinden bir örnek oluştur
	add_child(GameMode)  # GameMode'u sahneye ekle
	GameMode.oyuncuRollerini_ata()
	Hitler = GameMode.hitler
	print(GameMode.oyuncuRolleri)
	GameMode.olmek(2)

func _process(delta: float):
	if (fasist_yasa >= 4 and sansolyelik == Hitler) or (fasist_yasa == 6):
		GameMode.fasistZaferi()
	elif (liberal_yasa == 6):
		GameMode.liberalZaferi()
