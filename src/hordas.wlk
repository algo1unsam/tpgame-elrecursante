import wollok.game.*
import enemigos.*
import fondoMordor.*
import movimiento.*
import personaje.*
import audio.*
import acciones.*

class Horda{
	
	method inicio(){
		game.clear()
		//Tamanio
		game.width(27)
	    game.height(15)
	    game.addVisual(menu)
	    game.schedule(1,{audio.reproducirCancion("sonidos/menu")})
	    keyboard.enter().onPressDo{self.configurate()}
	}
	
	method configurate() {
		game.clear()
		game.addVisual(mordor)	
		game.schedule(1,{audio.pararCancion()})
		//Visuales	
		game.addVisual(aragorn)
		movimiento.configurarFlechas(aragorn)
	    game.onCollideDo(aragorn, {objeto => objeto.teEncontro(aragorn)})
	    
	}
}

object hordaUno inherits Horda{
	
	override method configurate(){
		super()
		const urukhai = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(2, 0))
		const urukhai2 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(17, 0))
		game.addVisual(urukhai)
		game.addVisual(urukhai2)
		urukhai.ejecutarMovimiento()
		urukhai2.ejecutarMovimiento()
		//Pasar pasa ahora hay que ponerle condicion
		//keyboard.p().onPressDo{self.dropeandoEscudo()}
		game.addVisual(escudo)
	}
	
	method dropeandoEscudo(){
		if(pasarNivel.verificar()){
			hordaDos.configurate()
		}
	}

}

object hordaDos inherits Horda{
	
	override method configurate(){
		super()
		const urukhai3 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(2, 5))
		game.addVisual(urukhai3)
	}
}