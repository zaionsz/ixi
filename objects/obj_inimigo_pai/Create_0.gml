
//Iniciando as variaveis para todos os inimigos
xscale=1;

// Iniciando os estados padrão dos inimigos

estado_idle		= new estado();
estado_move		= new estado();
estado_attack	= new estado();
estado_death	= new estado();
estado_hurt		= new estado();

// Definindo o Poise dos inimigos
poise = poise_max;


// iniciando estado idle por parão
inicia_estado(estado_idle);

