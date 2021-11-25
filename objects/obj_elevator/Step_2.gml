/// @description Insert description here
// You can write your code in this editor
if (is_elevator && is_physics) {
	var scalarX = abs(other.x - other.xprevious) + 1;
	var scalarY = abs(other.y - other.yprevious) + 1;
	
	with(src_instance_place(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_collider1)) {
		if (object_index != obj_wall && gravity_axis.x == other.gravity_axis.x 
			&& gravity_axis.y == other.gravity_axis.y) {
			x += other.x - other.xprevious;
			y += other.y - other.yprevious;
		}
	}
	with(src_instance_place(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_enemy)) {
		if (object_index != obj_wall && gravity_axis.x == other.gravity_axis.x 
			&& gravity_axis.y == other.gravity_axis.y) {
			x += other.x - other.xprevious;
			y += other.y - other.yprevious;
		}
	}

	scalarX = -scalarX;
	scalarY = -scalarY;
	with(src_instance_place(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_collider1)) {
		if (object_index != obj_wall) {
			if (gravity_axis.x == 0 && other.gravity_axis.x == 0
				&& abs(gravity_axis.y) != abs(other.gravity_axis.y)) {
				x += other.x - other.xprevious;
				y += other.y - other.yprevious;
			}
		}
	}
	with(src_instance_place(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_enemy)) {
		if (object_index != obj_wall) {
			if (gravity_axis.x == 0 && other.gravity_axis.x == 0
				&& abs(gravity_axis.y) != abs(other.gravity_axis.y)) {
				x += other.x - other.xprevious;
				y += other.y - other.yprevious;
			}
		}
	}
}

event_inherited();