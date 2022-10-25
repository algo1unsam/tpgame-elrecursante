import wollok.game.*
import hordas.*

object audio {
	var property cancionActual = null
	method cancion(cancionName) = game.sound( cancionName + ".wav")
	
	method reproducirCancion(nombreCancion) {
		cancionActual = self.cancion(nombreCancion)
		cancionActual.play()
	}
	
	method pararCancion(){
		if (cancionActual != null) {
			cancionActual.stop()
		}
		cancionActual = null
	}
}