/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor








// Inherit the parent event
event_inherited();

// Tudo depois desse codifo é sobreescrito
#region estado_idle

estado_idle.inicia = function()
{
	//Define a sprite que vai ser usada
	sprite_index = spr_piratas_idle;
	//Iniciar a animação do começo
	image_index = 0;
}

estado_idle.roda = function()
{
	
}

#endregion

#region estado_walk

estado_move.inicia = function()
{
	sprite_index = spr_piratas_move;
	image_index = 0;
}

estado_move.roda = function()
{
	
}


#endregion

//#region


//#endregion

//Inicinado o estado COM as mod
inicia_estado(estado_idle);