/// @description Actual use of the shader
if surface_exists(oBluestuff.surf){
	//Just set the shader and you're good.
	//Remember, this shader dithers based on opacity, not color.
	shader_set(shdr_dynaDither);
	draw_surface(oBluestuff.surf,0 ,0);
	shader_reset();
	
	//Our comparison
	draw_surface(oBluestuff.surf,64,0);
	draw_sprite(sInstruct,0,32,0);
}