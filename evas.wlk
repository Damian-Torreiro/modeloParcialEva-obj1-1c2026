import modos.*


object eva01 {
  var fuerzaAT = 2110
  var energia = 100
  method campoAT() = fuerzaAT
  method efectoDeSincroCon(piloto){
    fuerzaAT = (fuerzaAT + 1).min(2150)
    energia = energia - 25
  }
  method puntosQueOtorga() = 2

  method cumpleRequisitosSincro(piloto) = piloto.puntosEntrenamiento() >= 4 and energia > 30

  method recargarEnergia(horas){
    energia = (energia + 30 * horas).min(100)
  }
}

object eva02 {
    method campoAT() = 2114
    var energia = 100
    var modo = estandar
    method cumpleRequisitosSincro(piloto) = piloto.puntosEntrenamiento() >= 2 and energia > 20

    method cambioAModo(modoNuevo){
        modo = modoNuevo
    }

    method efectoDeSincroCon(piloto){
    energia = energia - modo.energiaConsumida()
  }
    method puntosQueOtorga() = modo.puntosQueOtorga()

    method recargarEnergia(horas){
    energia = (energia + 25 * horas).min(100)
  }
}

object eva00 {
  var fuerzaAT = 2100

  method mejorarFuerzaATen(mejoraDeFuerza) {
    fuerzaAT = (fuerzaAT + mejoraDeFuerza).min(2150)
  }

  method campoAT() = fuerzaAT
  method efectoDeSincroCon(piloto){

  }
  method puntosQueOtorga() = 1

  method cumpleRequisitosSincro(piloto) = true

}