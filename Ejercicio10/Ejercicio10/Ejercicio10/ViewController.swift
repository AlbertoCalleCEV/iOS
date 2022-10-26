//
//  ViewController.swift
//  Ejercicio10
//
//  Created by Apps2M on 6/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var num: UILabel!
    
    var numero: Int = 0
    
    
    
    @IBAction func sumarNumero(_ sender: Any) {
        let numeroAleatorio: Int = Int.random(in: 1...100)
        
        numero += numeroAleatorio
        num.text = String(numero)
    }
    
    @IBAction func restarNumero(_ sender: Any) {
        let numeroAleatorio: Int = Int.random(in: 1...100)
        
        numero -= numeroAleatorio
        num.text = String(numero)
    }
    
    @IBAction func multiplicarNumero(_ sender: Any) {
        let numeroAleatorio: Int = Int.random(in: 1...100)
        
        numero = numero * numeroAleatorio
        num.text = String(numero)
    }
    
    @IBAction func dividirNumero(_ sender: Any) {
        let numeroAleatorio: Int = Int.random(in: 1...100)
        
        numero = numero / numeroAleatorio
        num.text = String(numero)
    }
}

