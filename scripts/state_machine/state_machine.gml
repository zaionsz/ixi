//iniciando maquina de estados
function estado() constructor 
{
	//iniciando o estado
	static inicia = function () {};
	//rodando o estado
	static roda = function () {};
	//finalizando o estado
	static finaliza = function () {};
}

//funcoes para controlar minha maquina de estado 
//iniciando o estado
function inicia_estado(_estado)
{
	//salvando o estado passado em uma variavel 
	estado_atual = _estado
	
	//iniciando o estado atual
	estado_atual.inicia()
}

//rodando estado 
function roda_estado()
{
	estado_atual.roda()
}

//trocando de estado
function troca_estado(_estado)
{
	//finalizando o estado atual
	estado_atual.finaliza()
	
	//rodando o proximo estado
	estado_atual = _estado
	
	//iniciando o proximo estado
	estado_atual.inicia()
}



//definindo a sprite

function define_sprite(_dir = 0, _sprite_side, _sprite_front, _sprite_back)
{
	var _sprite;
	
	switch(_dir)
	{
		case 0: _sprite = _sprite_side; break;
		case 1: _sprite = _sprite_back; break;
		case 2: _sprite = _sprite_side; break;
		case 3: _sprite = _sprite_front; break;
	}
	
	return _sprite;
}