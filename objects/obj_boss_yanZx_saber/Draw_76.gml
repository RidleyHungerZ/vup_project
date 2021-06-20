if view_current!=0 exit
if !instance_exists(boss)
	instance_destroy()
x=boss.x
y=boss.y
image_xscale=boss.image_xscale
image_yscale=boss.image_yscale
image_angle=boss.image_angle
var bossSprName=sprite_get_name(boss.sprite_index),
	saberSprName=bossSprName+"_saber",
	saberSpr=asset_get_index(saberSprName);
if sprite_exists(saberSpr) {
	scr_sprite_change(saberSpr, boss.image_index, boss.image_speed)
	have_dmg=true
} else {
	scr_sprite_change(spr_none, 0, 0)
	have_dmg=false
}