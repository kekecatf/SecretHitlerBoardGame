extends Node2D

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")
var GameMode = null


var konum = [
	Vector2(500, 550),  # Oyuncu1 
	Vector2(120, 90),   # Oyuncu2
	Vector2(120, 300),  # Oyuncu3
	Vector2(1000, 90),  # Oyuncu4
	Vector2(1000, 300), # Oyuncu5
	Vector2(100, 300),  # Oyuncu6
	Vector2(300, 300),  # Oyuncu7
	Vector2(500, 300),  # Oyuncu8
	Vector2(700, 300),  # Oyuncu9
	Vector2(900, 300)   # Oyuncu10
]
var rotasyon = [0, 90, 90, -90, -90, -180, -180, -180, 90, -90]

func _ready():
	gamemode_entegrasyon()
	buton_olusturma()
	rolleri_atama()
	ilk_baskani_atama()

func gamemode_entegrasyon():
	GameMode = GameModeNode.instantiate()
	add_child(GameMode)
	GameManager.game_mode = GameMode

func buton_olusturma():
	for i in range(GameManager.game_mode.oyuncuSayisi):
		var button = load("res://Sceens/button.tscn").instantiate()
		button.position = konum[i]
		button.scale = Vector2(0.1, 0.1)
		button.rotation_degrees = rotasyon[i]
		button.oyuncu_id = i
		add_child(button)

func rolleri_atama():
	GameMode.oyuncuRollerini_ata()
	GameManager.Hitler = GameMode.hitler
	print("Hitler =", GameMode.hitler + 1)

func ilk_baskani_atama():
	randomize()
	GameManager.baskanlik = randi_range(0, GameMode.oyuncuSayisi - 1)
	print("İlk Başkan =", GameManager.baskanlik + 1)

func _process(delta):
	kazanma_kosullarini_kontrol_etme()

func kazanma_kosullarini_kontrol_etme():
	if (GameManager.fasist_yasa >= 4 and GameManager.sansolyelik == GameManager.Hitler) or (GameManager.fasist_yasa == 6):
		GameMode.fasistZaferi()
	elif GameManager.liberal_yasa == 6:
		GameMode.liberalZaferi()
