
//iniciando meu primeiro estado
estado_idle= new estado();

//iniciando o estado move
estado_move = new estado()

#region estado_idle
//meu estado idle precisa de um inicia
estado_idle.inicia = function()
{
	//definindo a sprite conforme a direção
	var _sprite = spr_personagem_idle
	
	//ajustando a sprite
	sprite_index = spr_personagem_idle
	
	//garantindo que a animação começa no primeiro frame
	image_index = 0
}

estado_idle.roda = function()
{
	//achando a condição para eu sair desse estado
	//se eu estiver em movimento, entao eu vou para o estado move
	if (velv or velh != 0)
	{
		troca_estado(estado_move)	
	}
	
}
#endregion

#region estado_move
estado_move.inicia = function()
{
	//configurando a sprite
	sprite_index = spr_personagem_move;
	//começando a animação do começo
	image_index = 0
}

estado_move.roda = function()
{
	
	
	//condição para sair do	estado
	//se eu estou parado eu vou para o estado de idle
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
vel = 2;

//controlando a direção em que o player ta olhando
dir = 0;

#endregion

//iniciando minha maquina de estados
inicia_estado(estado_idle)