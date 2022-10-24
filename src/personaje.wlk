import wollok.game.*
import movimiento.*
import enemigos.*
import acciones.*

object aragorn{
	var property position= game.at(12, 0)
	var property vida = 10
	var property orientacion = derecha
	var property tieneEscudo = false
	var property tieneAnduril = false
	
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
			game.schedule(4000, {game.stop()})
		}	
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

