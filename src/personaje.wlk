import wollok.game.*
import movimiento.*

object aragorn{
	var property position=game.center()
	var property vida = 10
	var property orientacion = abajo
	
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
		return "personaje/aragorn" + orientacion.nombre() + ".png"
	}	
	
	method murio(){
		return (vida==0)
	}
}

