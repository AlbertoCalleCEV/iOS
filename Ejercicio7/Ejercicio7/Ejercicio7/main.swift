//
//  main.swift
//  Ejercicio7
//
//  Created by Apps2M on 4/10/22.
//

import Foundation

//Ejercicio1()
Ejercicio4()

func Ejercicio1() {
    var miArray = [Int] ()
    var entrada: Int?
    
    repeat {
        
        print("Por favor, dame un número")
        entrada = Int(readLine()!)
        
        if entrada != nil {
            miArray.append(entrada!)
        }
        
    } while miArray.count <= 4
    
    let sumaTotal = miArray.reduce(0) { (total, n) in total + n }
    //    let sumaTotal = miArray.reduce(0, +)
    print("La suma total del array es " + String(sumaTotal) + " y la media es " + String(sumaTotal/miArray.count))
}

func Ejercicio4() {
    print("Dame una frase")
    let frase = String(readLine()!)
    var palabras: [String] = []
    
    palabras = frase.components(separatedBy: " ")
    
    let h = palabras.map{
        palabra -> String in
        
        if palabra.starts(with: "m") || palabra.starts(with: "j") || palabra.starts(with: "p") {
            return Censurar(palabra: palabra)
        } else {
            return palabra
        }
    }
    
    print(h.joined(separator: " "))
    
    func Censurar(palabra: String) -> String {
        
        var palabraTrozos: [String] = []
        var n: Int = 0
        
        // Trozeamos la palabra
        palabraTrozos = palabra.map{l  -> String in
            n += 1
            return Comprobar(palabraT: l, numero: n)
        }
        
        return palabraTrozos.joined()
        
    }
    
    func Comprobar(palabraT: Character, numero: Int) -> String {
        var l: String
        
        if numero == 1 {
            l = String(palabraT)
        } else {
            l = "*"
        }
        
        return l
    }
}
