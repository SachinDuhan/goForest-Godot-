extends Panel

@onready var item_display: Sprite2D = $item_display

func update(item: InvItem):
	if !item:
		print("hoyo")
		item_display.visible = false
	else:
		print("yoho")
		item_display.visible = true
		item_display.texture = item.texture
