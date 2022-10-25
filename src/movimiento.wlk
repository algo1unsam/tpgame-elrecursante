import wollok.game.*
import personaje.*
import enemigos.*
import hordas.*
import acciones.*

class Direccion{
		var property nombre
}

object izquierda inherits Direccion(nombre="Izquierda"){
	method siguiente(position) {
		return 	position.left(1)
	}
}

object derecha inherits Direccion(nombre="Derecha") {
	method siguiente(position) {
		return 	position.right(1)		
	}	
}

object abajo inherits Direccion(nombre="Derecha"){
		method siguiente(position) {
		return position.down(1)
	}
}

object arriba inherits Direccion(nombre="Derecha"){
	method siguiente(position) {
	return position.up(1)
	}
}

object mundo {
	method validarPosition(position,_aragorn) {
		if (! position.x().between(0, game.width() -1)){
			 _aragorn.error("Posicion fuera de ancho")
		}	
		if(! position.y().between(0, game.height() - 12)) {
			_aragorn.error("No puedo pasar")
		}
	}
	
	/*
	method mostrarVida(){
		coleccionDeVidas.image()	
	}
	*/
}
object movimiento{
	method configurarFlechas(visual){
		keyboard.a().onPressDo{ self.mover(izquierda,visual) } 
		keyboard.d().onPressDo{ self.mover(derecha,visual) }
		keyboard.w().onPressDo{ self.mover(arriba,visual) }
		keyboard.s().onPressDo{ self.mover(abajo,visual) }
		keyboard.space().onPressDo{visual.atacar(aragorn.ataque())}	
	}
	
	method mover(direccion,personaje){
		personaje.mover(direccion)		
	}

}
