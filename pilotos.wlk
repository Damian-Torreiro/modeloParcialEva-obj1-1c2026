import evas.*
import cuartel.*
object asuka {
    var property puntosDeEntrenamiento = 5
    var ultimoEvaSincro = eva01
    method estaSatisfecho() = ultimoEvaSincro.fuerzaAT() > 2115
    method efectoDeSincroCon(eva){
    ultimoEvaSincro = eva
    puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosQueOtorga()
  }

    method cumpleRequisitosSincro(eva) = eva.cumpleRequisitosSincro(self)
}

object shinji {
    var property puntosDeEntrenamiento = 2
    var ultimoEvaSincro = eva01
    const evasSincro = {}
    var estaDescansado = true
    method estaSatisfecho() = evasSincro == nerv.evas().asSet()

    method descansar(){
        estaDescansado = true
    }
    method efectoDeSincroCon(eva){
    ultimoEvaSincro = eva
    puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosQueOtorga()
    estaDescansado = false
    evasSincro.add(eva)
  }

    method cumpleRequisitosSincro(eva) = eva.cumpleRequisitosSincro(self) and estaDescansado
}

object rei {
    var property puntosDeEntrenamiento = 0
    var cantidadDeSincros = 0
    method estaSatisfecho() = cantidadDeSincros >= 1
    method efectoDeSincroCon(eva){
    puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosQueOtorga()
    cantidadDeSincros = cantidadDeSincros + 1
  }

    method cumpleRequisitosSincro(eva) = eva.cumpleRequisitosSincro(self) and eva.campoAT() >= 2110 and cantidadDeSincros < 5
}