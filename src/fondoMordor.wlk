import wollok.game.*

class Visual{
	var property image
	var property position = game.origin()
}

const mordor = new Visual(
	image = "personaje/mordor.png",
	position = new Position(x=0,y=0)
)