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
}