// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations

function src_magnet_range_reset() {
	with (obj_p2_grab) {
		in_grabRange = false;
		in_grabRangeClosest = false;
	}
}

function src_magnet_clean() {
	with (obj_p2_grab) {
		in_grabRange = false;
		in_grabRangeClosest = false;
		is_grabbed = false;
	}
}

function src_grab_range_show(_magnetX, _magnetY, _radius) {
	var _distMin = _radius * 2;
	var _closest = noone;

	with (collision_circle(_magnetX, _magnetY, _radius, obj_p2_grab, false, true)) {
		if (is_grabbed == false) {
			in_grabRange = true;
			var _distToMagnet = distance_to_point(_magnetX, _magnetY)
			if (_distToMagnet < _distMin) {
				_distMin = _distToMagnet;
				_closest = self;
			}
		}
	}
	with (_closest)
		in_grabRangeClosest = true;
	return (_closest);
}

function src_follow_magnet(_magnetX, _magnetY, _obj, _movable) {
	if (_obj != noone) {
		with (_obj) {
			var _targetX = 0;
			if (_movable)
				_targetX = x - (bbox_right - _magnetX);
			else
				_targetX = _magnetX;
			var _targetY = _magnetY;
			if (point_distance(x, y, _targetX, _targetY) < follow_speed) {
				x = _targetX;
				y = _targetY;
			}
			else {
				x += sign(_targetX - x) * follow_speed * (delta_time / ideal_delta_time);
				y += sign(_targetY - y) * follow_speed * (delta_time / ideal_delta_time);
			}
			if (_obj.object_index != obj_ball) {
				src_collision_panic(obj_collider1);
				src_collision_panic(obj_enemy);
			}
		}
		if (_movable) {
			var _targetX = (_obj.bbox_right) - (_magnetX - x);
			var _targetY = _obj.y;
			var _dist = point_distance(x, y, _targetX, _targetY);
			if (_dist > follow_speed * 3) {
				x += sign(_targetX - x) * follow_speed * (delta_time / ideal_delta_time);
				y += sign(_targetY - y) * follow_speed * (delta_time / ideal_delta_time);
			}
			if (_dist >= magnet_radius_max) {
				x_speed = follow_speed * sign(_targetX - x);
				y_speed = follow_speed * sign(_targetY - y);
			}
		}
	}
}