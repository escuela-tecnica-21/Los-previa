


object tateti {
	const combinacionesGanadoras = [[1,2,3],[1,4,7],[1,5,9],[2,5,8],[3,6,9],[3,5,7],[4,5,6],[7,8,9]]
	var jugadores = [new Jugador(marca = new Marca(nombre = "linux"),inteligencia=maquina),new Jugador(marca = new Marca(nombre = "win"))]

	var property casillerosLibres  
	var property casillerosOcupados = [] 

	var jugadorActual = jugadores.first()
	
	method iniciar()	{
		self.desplegarMarcas()
		self.desplegarJugadores()
		self.comenzar()		
	}

	
	method limpiar() {
		tablero.vaciar(casillerosOcupados)
		casillerosOcupados.clear()
		jugadores.forEach{j=>j.recomenzar()}
		casillerosLibres = [1,2,3,4,5,6,7,8,9]
	}
	method comenzar(){
		self.limpiar()
		jugadorActual = jugadores.first()
		jugadorActual.jugar()
	}
	method desplegarJugadores(){
		tablero.mostrarJugadores(jugadores)
	}
	method desplegarMarcas() {
		tablero.mostrarMarcas(jugadores.map{j=>j.marca()})
	}
	method siguienteJugada(){
		jugadorActual.jugar()
	}

	method jugadaInteractiva(casillero){
		if(jugadorActual.interactivo()){
			self.jugada(casillero)
		}
	}

	method jugada(casillero){
		self.validarFinPartido()
		self.validarCasilleroLibre(casillero)
		self.jugarTurno(jugadorActual,casillero)
		if(self.terminoElPartido())
			self.finalizar()
		else
			self.cambiarTurno()
	}
	
