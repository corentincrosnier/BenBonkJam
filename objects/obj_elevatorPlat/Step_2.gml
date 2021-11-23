/// @description Insert description here
// You can write your code in this editor
if (running) {
	with(instance_place(x, y - 4, obj_collider1)) {
		if (object_index != obj_wall) {
			x += other.x - other.xprevious;
			y += other.y - other.yprevious;
		}
	}
	with(instance_place(x, y - 4, obj_enemy)) {
		x += other.x - other.xprevious;
		y += other.y - other.yprevious;
	}
}