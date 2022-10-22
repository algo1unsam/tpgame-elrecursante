import wollok.game.*
import personaje.*
import movimiento.*

class Objeto{
	var property position = game.origin()
	var property image
	method teEncontro(alguien){}
	method meAtacaron(valor){}
	
	method soyEnemigo(){return false}
	
	
}

class Enemigo inherits Objeto(image="enemigos/orco.png", position = game.at(2, 0)) {
	var property vida = 1
	
	override method soyEnemigo(){return true}
	
	method seguirHeroe(){
		if ( ( (self.position().y()) != (aragorn.position().y()) ) || ( (self.position().x()) != (aragorn.position().x()))){
			if( (self.position().y()) - (aragorn.position().y()) > 0 ){
				position = self.position().down(1)
			}else if((self.position().y()) - (aragorn.position().y()) < 0){
				position = self.position().up(1)
			}else if(( (self.position().x()) - (aragorn.position().x()) ) < 0){
				position =  self.position().right(1)
			}else if(( (self.position().x()) - (aragorn.position().x()) ) > 0){
				position = self.position().left(1)
			}
		}	
	}
	
	override method teEncontro(enemigo){
			enemigo.restarVida(1)
		}
		
	method atacar(){
			return 1
		}
		
	override method meAtacaron(valor){
			vida = vida - valor
			if (vida == 0){
				game.removeVisual(self)
			}	
	}
}

