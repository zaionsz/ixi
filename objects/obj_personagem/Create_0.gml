
//iniciando meu primeiro estado
estado_idle= new estado();

//iniciando o estado move
estado_walk = new estado()

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

}


#endregion

#region variaveis
//controles estão sendo iniciados sem valor

up = noone;
down = noone;
right = noone;
left = noone;

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