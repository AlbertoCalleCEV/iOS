//
//  main.swift
//  Ejercicio6
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
    var numeroAnterior: Int = 0
    var contador: Int = 0

    for r in roman {
        if numeroAnterior < valorRomanos[r]! && contador >= 1{
            calcular += calcularResta(valor1: numeroAnterior, valor2: valorRomanos[r]!)
        } else {
            calcular += valorRomanos[r]!;
        }
        numeroAnterior = valorRomanos[r]!
        contador += 1
    }
    
    contador = 0
    
    let respuesta: String = "Su número es " + String(calcular)
    return respuesta;
}

func calcularResta(valor1: Int, valor2: Int) -> Int {
    return valor2 - (valor1 * 2)
}
