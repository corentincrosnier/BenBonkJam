/// @description Insert description here
// You can write your code in this editor
if (is_elevator && is_physics) {
	var scalarX = abs(other.x - other.xprevious) + 1;
	var scalarY = abs(other.y - other.yprevious) + 1;
	
	var _list = ds_list_create();
	var _num = src_instance_place_list(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_collider1, _list);
	for (var i = 0; i < _num; ++i;) {
		with (_list[| i]) {
			if (object_index != obj_wall && object_index != obj_door && object_index != obj_elevatorPlat && gravity_axis.x == other.gravity_axis.x
				&& gravity_axis.y == other.gravity_axis.y) {
				x += other.x - other.xprevious;
				y += other.y - other.yprevious;
			}
			else if (object_index == obj_door || object_index == obj_elevatorPlat) {
				if (other.object_index == obj_elevatorPlat)
					other.path_position = other.path_positionprevious;
			}
		}
	}
	with(src_instance_place(x - gravity_axis.x * scalarX, y - gravity_axis.y * scalarY, obj_enemy)) {
		if (object_index != obj_wall && gravity_axis.x == other.gravity_axis.x 
			&& gravity_axis.y == other.gravity_axis.y) {
			x += other.x - other.xprevious;
			y += other.y - other.yprevious;
		}
	}
}
event_inherited();