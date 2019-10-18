extends LineEdit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pageInstance = self.owner.get_parent()
onready var pageNamePopup = $"../../../../../Change Page Name"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("text_changed", self, "_update_label")
	pageInstance.connect("renamed",self, "_update_text")
	
	max_length = $"../..".rect_size.x / 6
	text = pageInstance.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _update_text():
	text = pageInstance.name
	_update_label(text)
		
func _update_label(newText):
	get_parent().get_node("Entry Text").text = newText

func _on_Entry_text_entered(new_text):
	_update_label(new_text)


func _on_Entry_gui_input(event):
	if Input.is_action_pressed("ui_select"):
		pageNamePopup.popup()
