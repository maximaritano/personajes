object luisa {
	var personajeActivo
	
	method asignarPersonaje(unPersonaje){
		personajeActivo = unPersonaje
	}
	
	method personajeActivo() = personajeActivo
	
	method aparece(unElemento){
	if (personajeActivo == null) self.error('No hay personaje activo')
	else personajeActivo.encontrar(unElemento)
	}
}
object floki{
	var arma = ballesta
	
	method encontrar(unElemento){
	if (arma.estaCargada()) {
	unElemento.recibirAtaque(arma.potencia())
	arma.registrarUso()
	}
	}
	
	method cambiarArma(nuevaArma){
		arma = nuevaArma
	}
}
object mario{
	var valorRecolectado = 0
	var ultimoElemento
	var elementos = #{}
	
	method elementos() = elementos
	
	method encontrar(unElemento) {
	elementos.add(unElemento)
	valorRecolectado += unElemento.valorQueOtorga()
	unElemento.recibirTrabajo()
	ultimoElemento = unElemento
	}
	
	method esFeliz(){
		return (valorRecolectado >= 50) 
		or (self.algunElementoTieneMasDe10Metros())
	}
	
	method algunElementoTieneMasDe10Metros(){
		return (elementos.any({elemento => elemento.altura() > 10}))
	}
	
	method valorRecolectado() = valorRecolectado
}
object fulano{
	var valorRecolectado = 0
	var elementos = #{}
	
	method elementos() = elementos
	
	method encontrar(unElemento) {
	elementos.add(unElemento)
	valorRecolectado += unElemento.valorQueOtorga()
	elementos.forEach({elemento => elemento.recibirTrabajo()})
	}
	
	method esFeliz(){
		return (valorRecolectado >= 50) 
		or (self.algunElementoTieneMasDe10Metros())
	}
	
	method algunElementoTieneMasDe10Metros(){
		return (elementos.any({elemento => elemento.altura() > 10}))
	}
	
	method valorRecolectado() = valorRecolectado
}
object ballesta{
	var flechas = 10
	
	method registrarUso(){
		flechas -= 1
	}
	
	method estaCargada(){
		return flechas > 0	
	} 
	
	method potencia() = 4
	
	method flechas() = flechas
	
}
object jabalina{
	var estaCargada = true	
	
	method registrarUso(){
		estaCargada = false
	}
	
	method estaCargada(){
		return estaCargada
	}
	
	method potencia() = 30
}
object castillo{
	var altura = 20
	var defensa = 150
	
	method altura() = altura
	
	method recibirAtaque(potencia){
	defensa -= potencia
	}
	
	method defensa() = defensa
	
	method valorQueOtorga() = defensa / 5
	
	method recibirTrabajo(){
		defensa += 20
		// PREGUNTAR MIN, DEFENSA MAXIMA 200
	}
}
object aurora{
	var altura = 1
	var estaViva = true
	
	method altura() = altura
	
	method recibirAtaque(potencia){
	if (potencia >= 10) estaViva = false 
	}
	
	method estaViva() = estaViva
	
	method valorQueOtorga() = 15
	
	method recibirTrabajo(){
		
	}
}
object tipa{
	var altura = 8
	
	method altura() = altura
	
	method recibirAtaque(potencia){
		
	}
	
		method valorQueOtorga(){
		return altura * 2
	}
	
	method recibirTrabajo(){
		altura += 1
	}
}
object estatuaDeOro{
	var altura = 5
	var valor = 60
	
	method altura() = altura
	
	method valorQueOtorga() = valor
	
	method recibirAtaque(potencia){
		valor -= potencia
	}
	
	method recibirTrabajo(){
		valor += 5
	}
}