object nave {
  const pasajeros = [neo, morfeo, trinity]
  
  method cantidadPasajeros() = pasajeros.size()
  
  method mayorVitalidad() = pasajeros.max({ pasajero => pasajero.vitalidad() })
  
  method subirPasajero(pasajero) {
    pasajeros.add(pasajero)
  }
  
  method bajarPasajero(pasajero) {
    pasajeros.remove(pasajero)
  }
  
  method menorVitalidad(){
    return pasajeros.min({ pasajero => pasajero.vitalidad() })
  }
  method estaEquilibrada(){
    return  self.menorVitalidad().vitalidad()*2 >= self.mayorVitalidad().vitalidad()
  }

  method estaElElegido() = pasajeros.any({ pasajero => pasajero.esElElegido() })
  
  method chocar() {
    pasajeros.forEach({ pasajero => pasajero.saltar() })
    pasajeros.clear()
  }
  
  method noSonElElegido(){
    return pasajeros.filter({pasajero => not pasajero.esElElegido()})
  }
  method acelerar() {
    self.noSonElElegido().forEach({ pasajero => pasajero.saltar() })
  }
}

object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method energia() = energia
  
  method saltar() {
    energia -= energia / 2
  }
  
  method vitalidad() = energia / 10
}

object morfeo {
  var vitalidad = 8
  var cansancio = false

  method cambiarVitalidad(num){
    vitalidad=num
  }
  
  method esElElegido() = false
  
  method energia() = 0
  
  method saltar() {
    cansancio=not cansancio
    vitalidad -= 1
  }
  
  method vitalidad() = vitalidad
}

object trinity {
  method esElElegido() = false
  
  method energia() = 0
  
  method saltar() {
  }
  method vitalidad() = 0
}