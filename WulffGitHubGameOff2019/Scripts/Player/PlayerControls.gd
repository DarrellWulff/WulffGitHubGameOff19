extends Camera

var input_pos = Vector2(0,0)
var ray_length = 1000
var mouse_input_flag = false

var input_state = 0

func _input(event):
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		input_pos = event.position
		input_state = 1
		mouse_input_flag = true
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 2:
		input_pos = event.position
		input_state = 2
		mouse_input_flag = true

func _physics_process(delta):
	
	if(mouse_input_flag):
		
		if(input_state == 1):
			print(input_pos);
		
		mouse_input_flag = false

func mouse_raycast(move_pos, collision_mask):
	var space_state = get_world().direct_space_state
	var from = project_ray_origin(input_pos)
	var to = from + project_ray_normal(input_pos) * ray_length
	var result = space_state.intersect_ray(from, to,[self],collision_mask)
	return result