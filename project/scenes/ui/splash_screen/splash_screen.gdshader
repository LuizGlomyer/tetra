shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);
	
	vec3 color1 = vec3(1, 0, 0); // RED
	vec3 color2 = vec3(0, 0, 1); // BLUE
	
	float ratio = SCREEN_UV.x;
	float iratio = 1.0 - SCREEN_UV.x;
	
	float new_r = color2.r * ratio + color1.r * iratio;
	float new_g = color2.g * ratio + color1.g * iratio;
	float new_b = color2.b * ratio + color1.b * iratio;
	
	COLOR = vec4(new_r, new_g, new_b, current_color.a);
	
}
