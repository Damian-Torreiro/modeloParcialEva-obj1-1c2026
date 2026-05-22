import pilotos.*
import evas.*


object nerv {
  const evas = []
  const pilotos = []

  method evas() = evas

  method registrarPiloto(piloto){
    pilotos.add(piloto)
  }

  method registrarEva(eva){
    evas.add(eva)
  }
  method intentarSincro(piloto, eva){
    if (self.puedenSincro(piloto, eva)){
        eva.efectoDeSincroCon(piloto)
        piloto.efectoDeSincroCon(eva)
    } else {
        self.error("No se pudo sincronizar")
    }
    }
  method puedenSincro(piloto, eva) = piloto.cumpleRequisitosSincro(eva) and eva.cumpleRequisitosSincro(piloto)

  method intentarSincroConTodosLosEvas(piloto) {
    evas.forEach({c => self.intentarSincro(piloto, c)})
  }

  method promedioPuntosPilotos() = (pilotos.sum({c => c.puntosDeEntrenamiento()})) / pilotos.size()

  method pilotoMayorCantPuntos() = pilotos.max({c => c.puntosDeEntrenamiento()})

  method valoresDeATEvas() = evas.map({c => c.campoAT()})  

  method evasQuePuedePilotar(piloto) = evas.filter({c => self.puedenSincro(piloto, c)}) 

  method todosPuedenPilotarAlMenosUnEva() = pilotos.all({c => self.evasQuePuedePilotar(c).size() > 0}) 

  method seConsideraStisfecho(piloto) = piloto.estaSatisfecha()
}