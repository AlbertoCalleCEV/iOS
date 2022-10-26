//
//  main.swift
//  Ejercicio4
//
//  Created by Apps2M on 26/9/22.
//

import Foundation

var palabras = [String] ()
var correccion: String = ""
var final: String
let Censura: [Character] = ["M", "J", "P", "m", "j", "p"]
var indice: Int = 0
var fCorreguida: String = ""

// Pedimos una frase.
print("Por favor, dame una frase:")
var frase: String = readLine()!
frase = frase + " "
var palabra: String = ""

// Recorremos la frase y la guardamos en Strings que luego las guardaremos en un Array después de correguirlas.
for f in frase{
    if  f != " " {
        palabra += "" + String(f)
    } else {
        // Mandamos a correguir las palabras a una función.
        final = Corregir(palabra: palabra)
        palabras.append(final)
        // Reiniciamos las variables para guardar una nueva palabra en los STRINGS.
        correccion = ""
        palabra = ""
    }
}

// Imprimimos en consola el resultado final.
for f in palabras {
    fCorreguida += String(f) + " "
}
print(fCorreguida)

func Corregir(palabra: String) -> String {
    var x: Int = 0
    var censurado: Bool = false
    
    // Comprobamos que la primera letra coincide con las censuradas.
    for c in Censura {
        if c == palabra[palabra.startIndex] {
            for _ in palabra {
                x += 1
                if x == 1 {
                    correccion += String(palabra[palabra.startIndex]) // Evitamos censurar la primera letra de la palabra censurada.
                } else {
                    correccion += "*" // Censuramos el resto de letras que forman la palabra.
                }
            }
            censurado = true
        }
    }
    
    // Mandamos las palabras censuradas y las no censuradas.
    if censurado {
        return correccion
    } else {
        return palabra
    }
}
