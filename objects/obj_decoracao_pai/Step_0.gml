// Ajustar profundidad

depth = -bbox_bottom;


if (transparente)
{
//Transparencia na arvore com o pleyer
//Verificar se personagem existe
	if (instance_exists(obj_personagem))
	{
		//Verificar se o personagem esta mais alto
		if (obj_personagem.y < y)
		{
			//Checar se player esta mais ou menos atras de mim
			if (point_in_rectangle(obj_personagem.x, obj_personagem.y, bbox_left - 10, bbox_top - 27, bbox_right + 10, bbox_top+1))
			{
				//Checando transparente
				image_alpha = lerp(image_alpha, .2, .02);
			}
			else
			{
				image_alpha = lerp(image_alpha, 1, .1);
			}
		
		}
	}
}
