//pegando os inputs do usuário
up		 = keyboard_check(ord("W"))
down	 = keyboard_check(ord("S"))
right	 = keyboard_check(ord("D"))
left	 = keyboard_check(ord("A"))

//aplicando os inputs à velocidade
velv = (down - up) * vel //o resultado da conta vai ser 0, 1 ou -1
velh = (right - left) * vel


//rodando a minha maquina de estados
roda_estado()




