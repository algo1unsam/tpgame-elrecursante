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
	    keyboard.enter().onPressDo{self.menuDos()}
	}
	
	method menuDos(){
		game.clear()
		game.addVisual(menu2)
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
		
		//Genero enemigos 
		const orco1 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(5, 0))
		const orco2 = new Enemigo(velocidad=800,image="enemigos/orco.png", position = game.at(17, 0))
		const orco3 = new Enemigo(velocidad=1200,image="enemigos/orco.png", position = game.at(1, 0))
		game.addVisual(orco1)
		game.addVisual(orco2)
		game.addVisual(orco3)
		orco1.ejecutarMovimiento()
		orco2.ejecutarMovimiento()
		orco3.ejecutarMovimiento()
		
		//Pasar Horda Dos
		game.onTick(1000, "verificar", {self.dropeandoEscudo()})
		self.pasarHorda()
	}
	
	method dropeandoEscudo(){
		if(pasarNivel.verificar()){
			game.removeTickEvent("verificar")
			game.addVisual(escudo)
			game.onTick(1000, "pasarHorda2", {self.pasarHorda()})
		}
	}
	
	method pasarHorda(){
		if(aragorn.tieneEscudo()){
			game.removeTickEvent("pasarHorda2")
			hordaDos.configurate()
		}
	}

}

object hordaDos inherits Horda{
	
	override method configurate(){
		super()
		
		//Genero Enemigos
		const urukhai = new Enemigo(velocidad=700,image="enemigos/urukhai.png", position = game.at(25, 0))
		const orco4 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(15, 0))
		game.addVisual(urukhai)
		game.addVisual(orco4)
		urukhai.ejecutarMovimiento()
		orco4.ejecutarMovimiento()
		
		//Paso Horda Tres
		game.onTick(3000, "verificar", {self.dropeandoAnduril()})
		self.pasarHorda()
	}
	
	method dropeandoAnduril(){
		if(pasarNivel.verificar()){
			game.removeTickEvent("verificar")
			game.addVisual(anduril)
			game.onTick(1000, "pasarHorda3", {self.pasarHorda()})
		}
	}
	
	method pasarHorda(){
		if(aragorn.tieneAnduril()){
			game.removeTickEvent("pasarHorda3")
			hordaTres.configurate()
		}
	}
}

object hordaTres inherits Horda{
	
	override method configurate(){
		super()
		const urukhai4 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(1, 12))
		game.addVisual(urukhai4)
	}
	
}