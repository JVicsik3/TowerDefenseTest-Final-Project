#tool
extends Node2D

@export var foliage_id: String = ""
@export var icon_scale: int = 1
@export var icon_texture: Texture2D 

@onready var icon_static = $FoliageIconStatic
@onready var icon = $FoliageIcon

var setup_completed = false

func _process(delta):
	if not setup_completed:
		setup()
		setup_completed = true
	
func setup():
	icon_static.is_static = true
	icon_static.foliage_id = foliage_id
	icon_static.icon_scale = icon_scale
	icon_static.icon_texture = icon_texture
	icon_static.is_configured = true
	
	icon.is_static = false
	icon.foliage_id = foliage_id
	icon.icon_scale = icon_scale
	icon.icon_texture = icon_texture
	icon.is_configured = true
