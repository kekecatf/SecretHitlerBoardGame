extends Node

var game_mode = null
var kartlar_ortaya_geldimi = false
var atilacak_kart_secildimi = false
var sansolyeye_verilecek_kart_secildimi = false
var change_count = 0
var liberal_yasa:int
var fasist_yasa:int

func sansolyeye_verilecek_kart():
	change_count += 1
	if change_count == 2:
		sansolyeye_verilecek_kart_secildimi = true
	else:
		sansolyeye_verilecek_kart_secildimi = false

func resetGlobal():
	game_mode = null
	kartlar_ortaya_geldimi = false
	atilacak_kart_secildimi = false
	sansolyeye_verilecek_kart_secildimi = false
	change_count = 0
