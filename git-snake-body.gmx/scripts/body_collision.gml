/// body_collision(object);
/// @arg object
var obj = argument0;

for(var i=1; i<nodes; i++){
     //collision
    var col = false;

    var _body = body;

    with(obj){
    if (rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
        _body[i-1, pr.p0x], _body[i-1, pr.p0y], _body[i-1, pr.p1x], _body[i-1, pr.p1y], _body[i, pr.p0x], _body[i, pr.p0y])
        ||
        rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
        _body[i, pr.p1x], _body[i, pr.p1y], _body[i-1, pr.p1x], _body[i-1, pr.p1y], _body[i, pr.p0x], _body[i, pr.p0y]))
        {
    col = true;
        }
    }

    //return true if collision is found
    if (col) return true;
}

return false;
