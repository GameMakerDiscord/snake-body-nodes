/// body_collision(object);
/// @arg object
/// Checks if the body is colliding with any instance/object,
/// using the edge coordinates stored inside the array for each node
var obj = argument0;

//Loop (starts from second node)
for(var i=1; i<nodes; i++){
     //collision
    var col = false; //no collision found, if this stays false

    var _body = body; //take array pointer
    
    //With the instance/object specified in the script,
    with(obj){
        //Check if its bbox rectangle comes in contact with
        //the (2) triangles around this node
        if (rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
            _body[i-1, pr.p0x], _body[i-1, pr.p0y], _body[i-1, pr.p1x], _body[i-1, pr.p1y], _body[i, pr.p0x], _body[i, pr.p0y])
            ||
            rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
            _body[i, pr.p1x], _body[i, pr.p1y], _body[i-1, pr.p1x], _body[i-1, pr.p1y], _body[i, pr.p0x], _body[i, pr.p0y]))
        {
            //If it does, set col to true
            col = true;
        }
    }

    //return true if collision is found
    if (col) return true;
}

//return false here, which means that no collision was found
return false;
