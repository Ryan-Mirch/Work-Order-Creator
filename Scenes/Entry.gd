extends LineEdit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("text_changed", self, "_update_label")
	max_length = $"../..".rect_size.x / 6
	_update_label(text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _update_label(newText):
	get_parent().get_node("Text").text = newText

func _on_Entry_text_entered(new_text):
	_update_label(new_text)