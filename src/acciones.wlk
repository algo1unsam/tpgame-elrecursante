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


