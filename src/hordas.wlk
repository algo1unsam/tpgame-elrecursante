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
		keyboard.enter().onPressDo{self.musica()}
	}
	
	method musica(){
		audio.pararCancion()
		audio.reproducirCancion("sonidos/musica")
		self.configurate()
	}
	
	method configurate() {
		game.clear()
		game.addVisual(mordor)
		
		//Visuales	
		game.addVisual(aragorn)
		movimiento.configurarFlechas(aragorn)
		//mundo.mostrarVida()
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
		const orco4 = new Enemigo(velocidad=1200,image="enemigos/orco.png", position = game.at(19, 0))	
		const orco5 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(7, 0))
		orco1.ejecutarMovimiento()
		orco2.ejecutarMovimiento()
		orco3.ejecutarMovimiento()
		orco4.ejecutarMovimiento()
		orco5.ejecutarMovimiento()
		pasarNivel.addVisualEnemigos()
		
		//Pasar Horda Dos
		game.onTick(1000, "verificar", {self.dropeandoEscudo()})
		self.pasarHorda()
	}
	
	method dropeandoEscudo(){
		if(pasarNivel.verificar()){
			game.removeTickEvent("verificar")
			game.addVisual(escudo)
			game.schedule(500, { game.say(aragorn, "¡Equipate el Escudo de GONDOR!!!") })
			game.onTick(1000, "pasarHorda2", {self.pasarHorda()})
		}
	}
	
	method pasarHorda(){
		if(aragorn.tieneEscudo()){
			aragorn.tengoEscudo()
			game.removeTickEvent("pasarHorda2")
			hordaDos.configurate()
		}
	}

}

object hordaDos inherits Horda{
	
	override method configurate(){
		super()
		
		//Genero Enemigos
		const orco1 = new Enemigo(velocidad=1000,image="enemigos/orco.png", position = game.at(26, 0))
		const urukhai = new Enemigo(velocidad=1000,image="enemigos/urukhai.png", position = game.at(25, 0))
		const urukhai2 = new Enemigo(velocidad=900,image="enemigos/urukhai.png", position = game.at(2, 0))
		const urukhai3 = new Enemigo(velocidad=800,image="enemigos/urukhai.png", position = game.at(3, 0))
		const urukhai4 = new Enemigo(velocidad=700,image="enemigos/urukhai.png", position = game.at(4, 0))
		const urukhai5 = new Enemigo(vida=2,velocidad=1000,image="enemigos/urukhaiEscudo.png", position = game.at(1, 0))		
		urukhai.ejecutarMovimiento()
		urukhai2.ejecutarMovimiento()
		urukhai3.ejecutarMovimiento()
		urukhai4.ejecutarMovimiento()
		urukhai5.ejecutarMovimiento()
		orco1.ejecutarMovimiento()
		pasarNivel.addVisualEnemigos()
		
		//Paso Horda Tres
		game.onTick(1000, "verificar", {self.dropeandoAnduril()})
		self.pasarHorda()
	}
	
	method dropeandoAnduril(){
		if(pasarNivel.verificar()){
			game.removeTickEvent("verificar")
			game.addVisual(anduril)
			game.schedule(500, { game.say(aragorn, "Anduril... Equipatela!") })
			game.onTick(1000, "pasarHorda3", {self.pasarHorda()})
		}
	}
	
	method pasarHorda(){
		if(aragorn.tieneAnduril()){
			aragorn.tengoAnduril()
			game.removeTickEvent("pasarHorda3")
			hordaTres.configurate()
			
		}
	}
}

object hordaTres inherits Horda{
	
	override method configurate(){
		super()
		const urukhai1 = new Enemigo(vida=2,velocidad=300,image="enemigos/urukhai.png", position = game.at(9, 0))
		const urukhai2 = new Enemigo(vida=2,velocidad=500,image="enemigos/urukhai.png", position = game.at(9, 0))
		const urukhai3 = new Enemigo(vida=2,velocidad=1000,image="enemigos/urukhaiEscudo.png", position = game.at(9, 0))
		const urukhai4 = new Enemigo(vida=2,velocidad=1200,image="enemigos/urukhaiEscudo.png", position = game.at(9, 0))
		const urukhai5 = new Enemigo(vida=2,velocidad=700,image="enemigos/urukhaiEscudo.png", position = game.at(9, 0))
		const urukhai6 = new Enemigo(vida=2,velocidad=800,image="enemigos/urukhaiEscudo.png", position = game.at(9, 0))
		const urukhai7 = new Enemigo(velocidad=900,image="enemigos/urukhaiEscudo.png", position = game.at(9, 0))	
		urukhai1.ejecutarMovimiento()
		urukhai2.ejecutarMovimiento()
		urukhai3.ejecutarMovimiento()
		urukhai4.ejecutarMovimiento()
		urukhai5.ejecutarMovimiento()
		urukhai6.ejecutarMovimiento()
		urukhai7.ejecutarMovimiento()
		pasarNivel.addVisualEnemigos()
		game.addVisual(pota1)
		game.addVisual(pota2)
		
		//GANAR
		game.onTick(1000, "verificar", {self.ganar()})
	}
	
	method ganar(){
		if(pasarNivel.verificar()){
			game.removeTickEvent("verificar")
			game.addVisual(ganaste)
			game.schedule(4000, {game.stop()})
		}
	}
}