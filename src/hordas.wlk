import wollok.game.*
import enemigos.*
import fondoMordor.*
import movimiento.*
import personaje.*

class Horda{
	
	method inicio(){
		//game.clear()
		//Tamanio
		game.width(27)
	    game.height(15)
	    
	    keyboard.enter().onPressDo{self.configurate()}
	}
	
	method configurate() {
		game.addVisual(mordor)	
		
		//Visuales	
		game.addVisual(aragorn)
		movimiento.configurarFlechas(aragorn)
	    game.onCollideDo(aragorn, {objeto => objeto.teEncontro(aragorn)})
	}
}

object hordaUno inherits Horda{
	
	override method configurate(){
		super()
		const urukhai = new Enemigo(image="enemigos/orco.png", position = game.at(2, 0))
		const urukhai2 = new Enemigo(image="enemigos/orco.png", position = game.at(17, 0))
		game.addVisual(urukhai)
		game.addVisual(urukhai2)
		urukhai.ejecutarMovimiento()
	}
}