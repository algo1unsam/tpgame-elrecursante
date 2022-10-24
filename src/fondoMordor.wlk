import wollok.game.*

class Visual{
	var property image
	var property position = game.origin()
	method teEncontro(param){}
}

const mordor = new Visual(
	image = "fondos/mordor.png",
	position = new Position(x=0,y=0)
)

const menu = new Visual(
	image = "fondos/menu.png",
	position = new Position(x=0,y=0)
)

const menu2 = new Visual(
	image = "fondos/menu2.png",
	position = new Position(x=0,y=0)
)