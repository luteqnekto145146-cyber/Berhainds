var cam = view_camera;
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

offset_x = x - cam_x; 
offset_y = y - cam_y;