extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func _editing_start():
	for lineEdit in get_tree().get_nodes_in_group("Editor Only"):
		lineEdit.visible = true
		
	for lineEdit in get_tree().get_nodes_in_group("Export Only"):
		lineEdit.visible = false
		
	for viewport in get_tree().get_nodes_in_group("Viewport"):
		viewport.gui_disable_input = false
	
func _exporting_start():
	for lineEdit in get_tree().get_nodes_in_group("Editor Only"):
		lineEdit.visible = false
		
	for popup in get_tree().get_nodes_in_group("Popup"):
		popup.visible = false
		
	for viewport in get_tree().get_nodes_in_group("Viewport"):
		viewport.gui_disable_input = true
	
func _popup_start():
	pass