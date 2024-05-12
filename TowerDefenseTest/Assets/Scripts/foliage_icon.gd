#tool
extends Node2D

# params:
var is_static = true
var foliage_id: String
var icon_scale = 1.0
var icon_texture: Texture2D 
#####

var normal_color = Color("d7d7d7")
var active_color = Color("ffffff")

@onready var sprite = $Sprite2D
@onready var icon_sprite = $Sprite2D/IconSprite

var on_focus = false
var dragging = false
var orinal_pos

var is_configured = false
var setup_completed = false

func setup():
	orinal_pos = self.position
	
	if foliage_id:
		$Node2D/Label.text = foliage_id
		
	icon_sprite.scale = Vector2(icon_scale, icon_scale)
	icon_sprite.texture = icon_texture

func _process(delta):
	if not is_configured:
		return
		
	if not setup_completed:
		setup()
		setup_completed = true
		
	if is_static:
		return
		
	if not dragging and on_focus and Input.is_action_pressed("pick_foliage") and not Game.foliage_id:
		dragging = true
		
	if dragging and Input.is_action_just_released("pick_foliage"):
		dragging = false
		position = orinal_pos
		Game.drop_foliage()
		
	if dragging:
		position = get_global_mouse_position() - self.get_parent().position
		Game.foliage_id = foliage_id
		
func _on_area_mouse_entered():
	if is_static:
		sprite.modulate = normal_color
	else:
		sprite.modulate = active_color
		on_focus = true


func _on_area_mouse_exited():
	if is_static:
		sprite.modulate = normal_color
	else:
		sprite.modulate = normal_color
		on_focus = false


func _on_area_2d_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	pass # Replace with function body.
