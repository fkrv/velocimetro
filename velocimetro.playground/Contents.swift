//: Playground: velocímetro

/*
    Programa en Swift que representa un velocímetro de un automóvil.
*/

import UIKit

/*Enumeración Velocidades y sus valores de tipo Int.*/
enum Velocidades : Int {
    case Apagado        = 0     //Elemento 1.
    case VelocidadBaja  = 20    //Elemento 2.
    case VelocidadMedia = 50    //Elemento 3.
    case VelocidadAlta  = 120   //Elemento 4.
    
    /*Función inicializadora*/
    init( velocidadInicial: Velocidades) {
        self = velocidadInicial //Se asigna a self el valor de velocidadInicial.
    }
}

/*Clase Auto*/
class Auto {
    
    var velocidad : Velocidades //Instancia de la enumeración Velocidades.
    
    /* Método init(). */
    init() {
        self.velocidad = .Apagado
    }
    
    /* Función cambioDeVelocidad. */
    func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String) {
        let velocidadActual = self.velocidad
        var velocidadEnCadena = ""
      
        /* Reglas de ejecución. */
        switch velocidadActual {
            case .Apagado:
                velocidadEnCadena = "Apagado"
                self.velocidad = .VelocidadBaja           //Siguiente velocidad.
            break;
            case .VelocidadBaja:
                velocidadEnCadena = "Velocidad baja"
                self.velocidad = .VelocidadMedia          //Siguiente velocidad.
            break;
            case .VelocidadMedia:
                velocidadEnCadena = "Velocidad media"
                self.velocidad = .VelocidadAlta           //Siguiente velocidad.
            break;
            case .VelocidadAlta:
                velocidadEnCadena = "Velocidad alta"
                self.velocidad = .VelocidadMedia          //Siguiente velocidad.
            break;
        }
        
        return (velocidadActual.rawValue, velocidadEnCadena)
    }
}

/* Instancia de la clase Auto */
var auto = Auto()

/*
    Prueba de la clase Auto
    iterando 20 veces el método cambioDeVelocidad().
*/
for var i in 1 ... 20 {
    
    var (velocidadActual, velocidadEnCadena) = auto.cambioDeVelocidad()
    
    print("\(i). \(velocidadActual), \(velocidadEnCadena)") //Impresión en consola.
}

