import plantas.*

class Parcela {
	const ancho
	const largo
	const horasDeSol
	const property plantas = #{}
	
	method superficie() = ancho * largo
	method cantidadMaxima() = 
		if (ancho > largo) self.superficie() / 5
		else self.superficie() / 3 + largo
		
	method tieneComplicaciones() = plantas.any({p=> p.horasDeSol() < horasDeSol})
	method plantarUnaPlanta(unaPlanta) = 
		if (self.cantidadDePlantas() + 1 > self.cantidadMaxima() || 
			(unaPlanta.horasDeSol() - horasDeSol).abs() >= 2) 
			self.error("No se puede plantar")
	else plantas.add(unaPlanta)
	method cantidadDePlantas() = plantas.size()
	method esParcelaIdeal(unaPlanta) = unaPlanta.esParcelaIdeal(self)
	method seAsociaBienA(unaPlanta)
	method algunaPlantaDeAltura(unaAltura) = plantas.any({p=>p.altura() > unaAltura})
	method cantidadDePlantasBienAsociadas() = plantas.count({p=>self.seAsociaBienA(p)})
}

class ParcelasEcologicas inherits Parcela {
	
	override method seAsociaBienA(unaPlanta) = !self.tieneComplicaciones() && self.esParcelaIdeal(unaPlanta)
}

class ParcelasIndustriales inherits Parcela {
	
	override method seAsociaBienA(unaPlanta) = self.cantidadMaxima() == 2 && unaPlanta.esFuerte()
}