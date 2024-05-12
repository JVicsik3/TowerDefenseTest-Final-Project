extends Node

var field_tile = null
var foliage_id = null
var foliage_pos
var seed_count = 0

const FOLIAGE_SCN = {
	"tree": preload("res://Assets/Entities/tree.tscn"),
}

const PROJECTILE_SCN = {
	"thorn": preload("res://Assets/Entities/tree.tscn"),
}

const ENEMY_SCN = {
	"fish": preload("res://Assets/Entities/fish.tscn"),
}

func drop_foliage():		
	if field_tile != null and field_tile.focus_on:
		foliage_pos = field_tile.global_transform.origin
		if foliage_id != null and foliage_id != "":
			var foliage_scn = FOLIAGE_SCN[foliage_id]
			var foliage = foliage_scn.instantiate()
			foliage.position = foliage_pos
			get_node("/root/Level1").add_child(foliage)
			
			field_tile.set_focus(false)
			
			print("Spawn:", foliage_pos, foliage_id)
			
	field_tile = null
	foliage_id = null
