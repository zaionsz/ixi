
//iniciando meu primeiro estado
estado_idle= new estado();

//iniciando o estado move
estado_walk = new estado()

//iniciando o estado de attack
estado_attack = new estado()

#region estado_idle
//meu estado idle precisa de um inicia
estado_idle.inicia = function()
{
	//definindo a sprite conforme a direção
	var _sprite = define_sprite(dir, spr_personagem_idle_side, spr_personagem_idle_front, spr_personagem_idle_back)
	
	//ajustando a sprite
	sprite_index = _sprite
	
	//garantindo que a animação começa no primeiro frame
	image_index = 0
}

estado_idle.roda = function()
{
	//achando a condição para eu sair desse estado
	//se eu estiver em movimento, entao eu vou para o estado walk
	if (up xor down or right xor left)
	{
		troca_estado(estado_walk)	
	}
	
	 //condicao para ir pro estado de attack
	 if (attack)
	{
		troca_estado(estado_attack)
	}
	
}
#endregion

#region estado_walk
estado_walk.inicia = function()
{
	dir = (point_direction(0, 0, right - left, down - up ) div 90)
	
	//definindo a sprite
	
	//configurando a sprite
	sprite_index = define_sprite(dir, spr_personagem_walk_side, spr_personagem_walk_front, spr_personagem_walk_back)
	//começando a animação do começo
	image_index = 0
}

estado_walk.roda = function()
{
	
	dir = (point_direction(0, 0, velh, velv) div 90)
	//condição para sair do	estado
	//se eu estou parado eu vou para o estado de idle
	
	//ajustando o lado que ele olha
	if (velh != 0)
	{
		image_xscale = sign(velh)
	}	
	
	//definindo a spritw
	sprite_index = define_sprite(dir, spr_personagem_walk_side, spr_personagem_walk_front, spr_personagem_walk_back)
	
	
	//movendo
	velv = (down - up) * vel //o resultado da conta vai ser 0, 1 ou -1
	velh = (right - left) * vel
	
	
	
	if (velv == 0 && velh == 0)
	{
		troca_estado(estado_idle)	
	}
	
	//indo para o estado de attack
	if (attack)
	{
		troca_estado(estado_attack)	
	}
	

}


#endregion

#region estado_attack

estado_attack.inicia = function ()
{
	//definindo  a sprite dele
	sprite_index = define_sprite(dir, spr_personagem_attack_side, spr_personagem_attack_front, spr_personagem_attack_back)
	
	image_index = 0
	
	velv = 0
	velh = 0
}
//configurando o estado de attack
estado_attack.roda = function ()
{

	//saindo do attack	quando ele acabar
	if (image_index >= image_number - 0.2)
	{
		//indo pro estado de parado
		troca_estado(estado_idle)
	}
}



#endregion


#region variaveis
//controles estão sendo iniciados sem valor

up = noone;
down = noone;
right = noone;
left = noone;
attack = noone;

//variaveis de movimento
//iniciando parado
velh = 0;
velv = 0;

//velocidade do jogador
vel = 1.5;

//controlando a direção em que o player ta olhando
dir = 0;

#endregion

//iniciando minha maquina de estados
inicia_estado(estado_idle)