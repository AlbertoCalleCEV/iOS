//
//  main.swift
//  Ejercicio8
//
//  Created by Apps2M on 28/9/22.
//

import Foundation

class Figura {
    var area: Float = 0
    var perimetro: Float = 0
    
    func obtenerPerimetro() -> Float {
        return perimetro;
    }
    
    func obtenerArea() -> Float {
        return area;
    }
}

print("¿Qué figura quieres crear? [triangulo, cuadrado, rectangulo o circulo]")
var figura = readLine();

while true {
    
    if figura == "triangulo"{
        crearTriangulo()
        break
    }
    else if figura == "cuadrado" {
        crearCuadrado()
        break
    }
    else if figura == "rectangulo" {
        crearRectangulo()
        break
    }
    else if figura == "circulo" {
        crearCirculo()
        break
    }
    else {
        print("")
    }
}

func crearTriangulo() {
    print("Dame la altura del triangulo: ")
    let altura = Float(readLine()!) ?? 0
    print("Dame la base del tiangulo: ")
    let base = Float(readLine()!) ?? 0
    print("Dame un lado del triangulo: ")
    let lado1 = Float(readLine()!) ?? 0
    print("Dame un lado del triangulo: ")
    let lado2 = Float(readLine()!) ?? 0
    print("Dame un lado del triangulo: ")
    let lado3 = Float(readLine()!) ?? 0
    
    let triangulo = Triangulo.init(altura: altura, base: base, lado1: lado1, lado2: lado2, lado3: lado3)
    print(triangulo.obtenerArea())
    print(triangulo.obtenerPerimetro())
    
}

func crearCuadrado() {
    print("Dame el lado del cuadrado")
    let lado = Float(readLine()!) ?? 0
    
    let cuadrado = Cuadrado.init(lados: lado)
    print(cuadrado.obtenerArea())
    print(cuadrado.obtenerPerimetro())
}

func crearRectangulo() {
    print("Dame la altura del rectangulo: ")
    let altura = Float(readLine()!) ?? 0
    print("Dame la base del rectangulo: ")
    let base = Float(readLine()!) ?? 0
    
    let rectangulo = Rectangulo.init(altura: altura, base: base)
    print(rectangulo.obtenerArea())
    print(rectangulo.obtenerPerimetro())
}

func crearCirculo() {
    print("Dame el radio del circulo: ")
    let radio =  Float(readLine()!) ?? 0
    
    let circulo = Circulo.init(radio: radio)
    print(circulo.obtenerArea())
    print(circulo.obtenerPerimetro())
}


class Triangulo: Figura {
    var alturaTri: Float
    var baseTri: Float
    var lado1: Float
    var lado2: Float
    var lado3: Float
    
    override func obtenerPerimetro() -> Float {
        return lado1 + lado2 + lado3
    }
    
    override func obtenerArea() -> Float{
        return (alturaTri * baseTri) / 2
    }
    
    init(altura: Float, base: Float, lado1: Float, lado2: Float,  lado3: Float) {
        self.alturaTri = altura
        self.baseTri = base
        self.lado1 = lado1
        self.lado2 = lado2
        self.lado3 = lado3
    }
}

class Circulo: Figura {
    public var radio: Float

    
    init(radio: Float) {
        self.radio = radio
    }
    
    override func obtenerPerimetro() -> Float {
        return 2 * 3.1416 * radio
    }
    
    override func obtenerArea() -> Float{
        return 3.1416 * (radio * radio)
    }
    
}

class Rectangulo: Figura {
    var alturaRect: Float
    var baseRect: Float
    
    override func obtenerPerimetro() -> Float {
        return (2 * baseRect) + (2 * alturaRect)
    }
    
    override func obtenerArea() -> Float{
        return baseRect * alturaRect
    }
    
    init(altura: Float, base: Float) {
        self.alturaRect = altura
        self.baseRect = base
    }
}

class Cuadrado: Figura {
    var lados: Float
    
    override func obtenerPerimetro() -> Float {
        return 4 * lados
    }
    
    override func obtenerArea() -> Float{
        return lados * lados
    }
    
    init(lados: Float) {
        self.lados = lados
    }
}
