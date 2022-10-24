import wollok.game.*
import personaje.*
import enemigos.*

class Armas{
	var property image
	var property position = game.origin()
	
	method teEncontro(alguien){}
	
	method meAtacaron(valor){}
}

object escudo inherits Armas(image="armas/escudo.png"){
	var property nombre = self
	
	override method teEncontro(alguien){
		aragorn.tieneEscudo(true)
		game.removeVisual(self)
	}
}

object anduril inherits Armas(image="armas/anduril.png"){
	var property nombre = self
	
	override method teEncontro(alguien){
		aragorn.tieneAnduril(true)
		game.removeVisual(self)
	}
}

class Vidas{
	var property image
	var property position= game.at(10, 9)
}

const barraVida100 = new Vidas(image="vida/vida100.png")
const barraVida75 = new Vidas(image="vida/vida75.png")
const barraVida50 = new Vidas(image="vida/vida50.png")
const barraVida25 = new Vidas(image="vida/vida25.png")

object coleccionDeVidas{
	var property vidas = []
	
	method image() {
		self.calculandoVida()
		vidas.forEach({ i => game.addVisual(i)})
	}
	
	method agregarVida(){
		
	}
	
	method removerVida() {
		self.image()
	}
	
	method calculandoVida(){
		if(aragorn.vida() <= self.vida100()){
			vidas.add(barraVida100)
		}
		if(aragorn.vida() <= self.vida75()){
			vidas.add(barraVida75)
		}
		if(aragorn.vida() <= self.vida50()){
			vidas.add(barraVida50)
		}
		if(aragorn.vida() <= self.vida25()){
			vidas.add(barraVida25)
		}
	}
	
	method vida100(){
		return (aragorn.vidaInicial() * 100 ) / 100
	}
	
	method vida75(){
		return (aragorn.vidaInicial() * 75 ) / 100
	}
	
	method vida50(){
		return (aragorn.vidaInicial() * 50 ) / 100
	}
	
	method vida25(){
		return (aragorn.vidaInicial() * 25 ) / 100
	}
}




