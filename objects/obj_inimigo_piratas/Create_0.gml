/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Timer para mudar de estado
tempo_estado = game_get_speed(gamespeed_fps) * 15;
timer_estado = tempo_estado

destino_x = 0;
destino_y = 0;

alvo = noone;

// Inherit the parent event
event_inherited();

estado_hunt = new estado();

// Tudo depois desse codifo é sobreescrito
#region estado_idle

estado_idle.inicia = function()
{
	//Define a sprite que vai ser usada
	sprite_index = spr_piratas_idle;
	//Iniciar a animação do começo
	image_index = 0;
	
	timer_estado = tempo_estado;
}

estado_idle.roda = function()
{
	//Diminuindo o timer do estado
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if (_tempo <= tempo_estado * .01)
	{
		
		var _estado = choose (estado_idle, estado_move, estado_idle);
		troca_estado(_estado);
	}
}

#endregion

#region estado_move

estado_move.inicia = function()
{
	sprite_index = spr_piratas_move;
	image_index = 0;
	
	//Resetar o timer do move
	timer_estado = tempo_estado;
	
	//Escolhendo um local para ele ir	
	
	//Escolhendo aleatoriamente para onde ele deve ir
	destino_x = irandom(room_width);
	destino_y = irandom(room_height);
}

estado_move.roda = function()
{
	//Diminuindo o timer do estado
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if(_tempo <= 5)
	{
		var _estado_novo = choose(estado_idle, estado_move);
		troca_estado(_estado_novo);
		
	}
	
	//Desviando até o destsaino
	mp_potential_step_object(destino_x, destino_y, 1 ,obj_colisor);
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	sprite_index = spr_piratas_attack;
	image_index = 0;
}
estado_attack.roda = function()
{
	//Saindo do estado de attack
	if(image_index >= image_number - .5)
	{
		troca_estado(estado_idle);
	}
}

#endregion

#region estado_hurt

estado_hurt.inicia = function()
{
	sprite_index = spr_piratas_hurt;
	image_index = 0;
	
	//Perdendo vida
	vida--;
}
estado_hurt.roda = function()
{
	
	//Saindo do estado de dano
	//Se ainda tem vida ainda pode tomar dano
	//Verificar se a anim ja acabou
	if (image_index >= image_number - .5)
	{
		if (vida > 0)
		{
			troca_estado(estado_hunt);
		}
		else //Nao tem vida, ta morto
		{
			troca_estado(estado_death);
		}
	}
}
#endregion

#region estado_death

estado_death.inicia = function()
{
	sprite_index = spr_piratas_death;
	image_index = 0;
}
estado_death.roda = function()
{
	//Morre diabo
	if (image_index >= image_number - .5)
	{
		instance_destroy();
	}
}
#endregion

#region estado_hunt
estado_hunt.inicia = function()
{
	sprite_index = spr_piratas_move;
	image_index = 0;
	
	image_blend = c_yellow;

	if (instance_exists(obj_personagem))
	{
		alvo = obj_personagem.id;	
	}
}

estado_hunt.roda = function()
{
	// Se o alvo nao existe ele fica deboinha
	if(!instance_exists(obj_personagem))
	{
		alvo = noone;
		troca_estado(estado_idle);
	}
	//Definindo alvo com jogador
	//Seguir o alvo
	mp_potential_step_object(alvo.x, alvo.y, 1, obj_colisor);
	
	//Atacando o personagem
	//Checando a distancia para o personagem
	var _dist = point_distance(x,y, alvo.x,alvo.y);

	if(_dist <= 10)
	{
		troca_estado(estado_attack);
	}
	
}
	
#endregion


//Inicinado o estado COM as mod
inicia_estado(estado_idle);