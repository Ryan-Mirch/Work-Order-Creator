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
	if Global.state != 1: return
	$"../Text".text = newText
	
	
	for seg in get_tree().get_nodes_in_group("Header Segment"):
		if seg.name == $"../..".name && seg != $"../..":
			seg._set_text(newText)
	
	Global._save()
	
func _set_text(s):
	text = s
	$"../Text".text = s
	
	
	