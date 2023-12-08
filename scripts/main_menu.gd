extends Node2D

func _ready():
	# TODO spawn some bullets just cuz
	pass


func _on_quit_button_pressed():
	# notify about termination
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	
	# terminate process
	get_tree().quit()

func _on_github_button_pressed():
	OS.shell_open("https://github.com/sandorex/ShootyShooty")
