object rolando {
    const artefactos = []
    const historia = []
    var maxArtefactos = 2

    method artefactos() = artefactos

    method artefactosTotales() = artefactos + castillo.inventario()

    method poseeArtefacto(artefacto) = self.artefactosTotales().contains(artefacto)

    method consultarHistoria() = historia

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
        self.agregarArtefacto(artefacto)
    }

    method agregarArtefacto(artefacto) {
        artefactos.add(artefacto)
    }

    method agarrarSiPuede(artefacto) {
        if (self.puedeAgarrar()) {
            self.agarrar(artefacto)
        }
    }

    method guardarArtefactosEnCastillo() {
        castillo.guardar(artefactos)
        self.vaciarArtefactos()
    }

    method vaciarArtefactos() {
        artefactos.clear()
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

}

object libroDeHechizos {

}

object collarDivino {

}

object armaduraDeAceroValyrio {

}