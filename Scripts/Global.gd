extends Node


onready var companyName = "Company Name Placeholder"
onready var softwareVersion = "WOC - " + companyName + " - 1.0.2"

var state = 0
var root = null
func _ready():
	root = get_tree().get_root().get_node("Main")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func _save():
	if state == 1:
		root._save()

func _editing_start():
	state = 1
	for lineEdit in get_tree().get_nodes_in_group("Editor Only"):
		lineEdit.visible = true
		
	for lineEdit in get_tree().get_nodes_in_group("Export Only"):
		lineEdit.visible = false
		
	for viewport in get_tree().get_nodes_in_group("Viewport"):
		viewport.gui_disable_input = false
		
	
	
func _exporting_start():
	state = 2
	for lineEdit in get_tree().get_nodes_in_group("Editor Only"):
		lineEdit.visible = false
		
	for popup in get_tree().get_nodes_in_group("Popup"):
		popup.visible = false
		
	for viewport in get_tree().get_nodes_in_group("Viewport"):
		viewport.gui_disable_input = true
	
func _popup_start():
	state = 3
	for viewport in get_tree().get_nodes_in_group("Viewport"):
		viewport.gui_disable_input = true
		
func _get_date_and_time():
	var time = OS.get_datetime()
	var result = ""
	var day = time["day"]
	var dst = time["dst"]
	var hour = time["hour"]
	var minute = time["minute"]
	var month = time["month"]
	var second = time["second"]
	var year = time["year"]
		
	result = str(day)+"-"+str(month)+"-"+str(year)+" " + str(hour) + "." + str(minute)+"."+str(second)
	return result
