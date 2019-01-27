extends Node2D

func _ready():
	$turn_manager.connect(
		"start_player_turn", $player, "_on_start_player_turn")