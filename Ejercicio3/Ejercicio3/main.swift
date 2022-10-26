//
//  main.swift
//  Ejercicio3
//
//  Created by Alumnos on 22/9/22.
//

import Foundation

var miArray = [Int] ()
var entrada: Int?
var operacion = 0

repeat {
    
    print("Por favor, dame un número")
    entrada = Int(readLine()!)
    
    if entrada != nil {
        miArray.append(entrada!)
    }
    
} while miArray.count <= 4

Calcular()


func Calcular() {
    for i in miArray {
        operacion += i
    }

    print("La suma de los números es", operacion, "y la media es", operacion / miArray.count)
}


