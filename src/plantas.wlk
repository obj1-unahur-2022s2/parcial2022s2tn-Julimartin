import parcelas.*

class Planta {
	const anioDeObtencion
	const property altura
	
	method horasDeSol()
	method esFuerte() = self.horasDeSol() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacio()
	method esParcelaIdeal(unaParcela)
	method seAsociaBienA(unaParcela) = unaParcela.seAsociaBienA(self)
}

class Menta inherits Planta{

	override method horasDeSol() = 6
	override method daNuevasSemillas() = super() || altura > 0.4
	override method espacio() = altura * 3
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{

	override method horasDeSol() = 
		if (altura < 0.5) 6
		else if (altura.between(0.5,1)) 7
		else 9
	
	override method daNuevasSemillas() = super() || anioDeObtencion > 2007 && altura > 1
	override method espacio() = altura / 2
	override method esParcelaIdeal(unaParcela) = self.horasDeSol() == unaParcela.horasDeSol()
}

class Quinoa inherits Planta{
	const horasDeSol

	override method horasDeSol() = horasDeSol
	
	override method daNuevasSemillas() = super() || anioDeObtencion < 2005
	override method espacio() = 0.5
	override method esParcelaIdeal(unaParcela) = !unaParcela.algunaPlantaDeAltura(1.5)
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
	
}

class HierbaBuena inherits Menta {
	
	override method espacio() = super() * 2
}