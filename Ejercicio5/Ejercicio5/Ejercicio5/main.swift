//
//  main.swift
//  Ejercicio5
//
//  Created by Apps2M on 27/9/22.
//

import Foundation

var upperRomano: String = ""
var calcular: Int = 0
var valorRomanos: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

print("Por favor, escriba un numero romano")
var romano: String = readLine()!
upperRomano += romano.uppercased()
print(calcularRomano(roman: upperRomano))

func calcularRomano(roman: String) -> String {
    for r in roman{
        calcular += valorRomanos[r]!;
    }
    
    let respuesta: String = "Su número es " + String(calcular)
    return respuesta;
}
