import wollok.game.*
import personaje.*
import enemigos.*

class Armas{
	var property image
	var property position = game.origin()
	
	method teEncontro(alguien){}
	
	method meAtacaron(valor){}
}

object escudo inherits Armas(image="armas/escudo.png",position= game.at(12, 0)){
	var property nombre = self
	
	override method teEncontro(alguien){
		aragorn.tieneEscudo(true)
		aragorn.tengoEscudo()
		game.removeVisual(self)
	}
}

object anduril inherits Armas(image="armas/anduril.png",position= game.at(12, 0)){
	var property nombre = self
	
	override method teEncontro(alguien){
		aragorn.tieneAnduril(true)
		aragorn.tengoAnduril()
		game.removeVisual(self)
	}
}

class Pota inherits Armas(image="vida/pota.png"){
	override method teEncontro(alguien){
		game.removeVisual(self)
		alguien.tomarPota(2)
	}
}

const pota1 = new Pota(position= game.at(12, 0))
const pota2 = new Pota(position= game.at(12, 4))

/* 
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
		if(aragorn.vida() <= self.vida25()){
			vidas.add(barraVida25)
		}else if(aragorn.vida() <= self.vida50()){
			vidas.add(barraVida50)
		}else if(aragorn.vida() <= self.vida75()){
			vidas.add(barraVida75)
		}else if(aragorn.vida() <= self.vida100()){
			vidas.add(barraVida100)
		}
	}
	
	method vida100(){
		return (aragorn.vidaMax() * 100 ) / 100
	}
	
	method vida75(){
		return (aragorn.vidaMax() * 75 ) / 100
	}
	
	method vida50(){
		return (aragorn.vidaMax() * 50 ) / 100
	}
	
	method vida25(){
		return (aragorn.vidaMax() * 25 ) / 100
	}
}
*/


