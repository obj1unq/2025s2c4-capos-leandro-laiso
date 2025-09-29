object rolando {
    const artefactos = []
    const historia = []
    var maxArtefactos = 2
    var poderBase = 5

    method artefactos() = artefactos

    method artefactosTotales() = artefactos + castillo.inventario()

    method poseeArtefacto(artefacto) = self.artefactosTotales().contains(artefacto)

    method historia() = historia

    method poderBase() = poderBase

    method poderDePelea() = poderBase + self.poderDeArtefactos()

    method poderDeArtefactos() = artefactos.sum({a => a.poderQueOtorga(self)})

    method puedeAgarrar() = artefactos.size() < maxArtefactos

    method encontrar(artefacto) {
        historia.add(artefacto)
        self.agarrarSiPuede(artefacto)
    }

    method validarAgarrar() {
        if (not self.puedeAgarrar()) {
            self.error("No puedo agarrar más artefactos")
        }
    }

    method agarrar(artefacto) {
        self.validarAgarrar()
        artefactos.add(artefacto)
    }

    method agarrarSiPuede(artefacto) {
        if (self.puedeAgarrar()) {
            self.agarrar(artefacto)
        }
    }

    method guardarArtefactosEnCastillo() {
        castillo.guardar(artefactos)
        artefactos.clear()
    }

    method aumentarCapacidad() {
        maxArtefactos += 1
    }

    method batallar() {
        artefactos.forEach({a => a.usarEnBatalla()})
        poderBase += 1
    }
}

object castillo {
    const inventarioCastillo = []

    method inventario() = inventarioCastillo

    method guardar(cosas) {
        inventarioCastillo.addAll(cosas)
    }
}

object espadaDelDestino {
    var cantBatallas = 0

    method fueUtilizada() = cantBatallas > 0

    method poderQueOtorga(personaje) {
        return 
            if (not self.fueUtilizada()) {
                personaje.poderBase()
            } else {
                personaje.poderBase() * 0.5
            }
    }

    method usarEnBatalla() {
        cantBatallas += 1
    }
}

object libroDeHechizos {

}

object collarDivino {
    var cantBatallas = 0
    const poderBase = 3

    method poderQueOtorga(personaje) {
        return
            if (personaje.poderBase() > 6) {
                poderBase + cantBatallas
            } else {
                poderBase
            }
    }

    method usarEnBatalla() {
        cantBatallas += 1
    }
}

object armaduraDeAceroValyrio {
    const poderBase = 6

    method poderQueOtorga(personaje) = poderBase

    method usarEnBatalla() {

    }
}