import wollok.game.*
import personaje.*
import movimiento.*
import hordas.*

class Objeto{
	
	method teEncontro(alguien){}
	
	method meAtacaron(valor){}
	
	//method soyEnemigo(){return false}
	
}

class Enemigo inherits Objeto{
	
	var property vida = 1
	var property image
	var property position = game.origin()
	var property velocidad
	
	//override method soyEnemigo(){return true}
	
	method agregar(){
		pasarNivel.agregar(self)
	}
	
	method delete(){
		pasarNivel.delete(self)
	}
	
	method seguirHeroe(){
		if ( ((self.position().y()) != (aragorn.position().y()) ) || ( (self.position().x()) != (aragorn.position().x()) ) ){
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
		/* 
		if (self.position().x() != aragorn.position().x()){
			if(( (self.position().x()) - (aragorn.position().x()) ) < 0){
				position =  self.position().right(1)
			}else if(( (self.position().x()) - (aragorn.position().x()) ) > 0){
				position = self.position().left(1)
			}
		}
		
		*/	
	}
	
	override method teEncontro(enemigo){
			enemigo.restarVida(1)
		}
		
	//method atacar(){
	//		return 1
	//}
		
	override method meAtacaron(valor){
			vida = vida - valor
			if (vida <= 0){
				game.removeVisual(self)
				self.delete()
			}	
	}
	
	method ejecutarMovimiento(){
		self.agregar()
		game.onTick(velocidad, "movimiento", {self.seguirHeroe()})
	}
}


object pasarNivel{
	
	var property cantEnemigosVivos = #{}
	
	method verificar(){
		return cantEnemigosVivos.isEmpty()
	}
	
	method agregar(enemigo){
		cantEnemigosVivos.add(enemigo)
	}
	
	method delete(enemigo){
		cantEnemigosVivos.remove(enemigo)
	}
	
	method addVisualEnemigos(){
		cantEnemigosVivos.forEach({ i => game.addVisual(i)})
	}
	
	method ejecutarMovimientoEnemigos(){
		cantEnemigosVivos.forEach({i => i.ejecutarMovimiento()})
	}
}