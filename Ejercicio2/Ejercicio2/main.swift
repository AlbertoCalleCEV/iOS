//
//  main.swift
//  Ejercicio2
//
//  Created by Alumnos on 21/9/22.
//

import Foundation

var gun: Int = 6
var jugador: Int = 0
var respuestaJ1: Int?
var respuestaJ2: Int?
var bullet: Int
var shoot: Int

repeat {
    bullet = Int.random(in: 1...gun)
    jugador = ((jugador) % 2) + 1
    print("Turno del jugador", jugador)
    _ = readLine()
    
    shoot = Int.random(in: 1...gun)
    
    gun -= 1
} while shoot != bullet

if shoot == bullet {
    print("PUM")
}
