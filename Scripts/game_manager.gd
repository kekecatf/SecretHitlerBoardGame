extends Node

var game_mode = null
var kartlar_ortaya_geldimi = false
var atilacak_kart_secildimi = false
var sansolyeye_verilecek_kart_secildimi = false
var change_count = 0

func sansolyeye_verilecek_kart():
	change_count += 1
	if change_count == 2:
		sansolyeye_verilecek_kart_secildimi = true
	else:
		sansolyeye_verilecek_kart_secildimi = false
