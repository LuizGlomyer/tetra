shader_type canvas_item;

void vertex() {
	UV.x += TIME;
	UV.y -= TIME / 5.0;
}
