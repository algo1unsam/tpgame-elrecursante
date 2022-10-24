import wollok.game.*
import movimiento.*
import enemigos.*
import acciones.*
import fondoMordor.*

object aragorn{
	var property position= game.at(12, 0)
	const property vidaInicial = 20
	var property vida = 20
	var property orientacion = derecha
	var property tieneEscudo = false
	var property tieneAnduril = false
	var property ataque = 1
	
	
	method validarPosition(_position){
		mundo.validarPosition(_position, self)
	} 
	
	method mover(direccion){
		if(!self.murio()){
			const proximaPosition= direccion.siguiente(position)
			self.validarPosition(proximaPosition)
			self.orientacion(direccion)
			position = proximaPosition		
		}else{
			game.allVisuals().forEach({ visual => game.removeVisual(visual)})
			game.addVisual(gameOver)
			game.schedule(4000, {game.stop()})
		}	
	}
	
	method tengoAnduril(){
		ataque = ataque + 9
	}
	
	method tengoEscudo(){
		vida = vida + 5
	}
	
	method image() {
		if(tieneAnduril){
			return "personaje/aragorn" + orientacion.nombre() + anduril.nombre() + ".png"	
		}else if(tieneEscudo){
			return "personaje/aragorn" + orientacion.nombre() + escudo.nombre() + ".png"
		}
		return "personaje/aragorn" + orientacion.nombre() + ".png"
	}
	
	
	method meAtacaron(valor){
		self.restarVida(valor)
		coleccionDeVidas.removerVida()
	}
	
	method restarVida(valor){
		if(vida < 5){
			game.say(self, "Cuidado, me queda "+vida+" de vida!")
		}
		if(vida > 0){
			vida = vida - valor
		}else {
			self.murio()
		}
	}
	
	method murio(){
		return (vida==0)
	}

	method atacar(danio){
 		const objetosDebajo = game.colliders(self)
 		objetosDebajo.forEach({ objeto =>  objeto.meAtacaron(danio) })
 	}
	
}

