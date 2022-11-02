import parcelas.*

object inta {
	const property listaDeParcelas = #{}
	
	method promedioDePlantas() = listaDeParcelas.sum({p=>p.cantidadDePlantas()})/ self.cantidadDeParcelas()
	method cantidadDeParcelas() = listaDeParcelas.size()
	method masAutosustentable() = self.parcelasConMasDe(4).max({p=>p.cantidadDePlantasBienAsociadas()})
	method parcelasConMasDe(unNumero)= listaDeParcelas.filter({p=>p.cantidadDePlantas() > unNumero})
}