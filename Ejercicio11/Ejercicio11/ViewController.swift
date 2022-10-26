//
//  ViewController.swift
//  Ejercicio11
//
//  Created by Apps2M on 18/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var falloNombre : Bool = false
    var falloDni : Bool = false
    
    @IBOutlet weak var edad: UILabel!
    @IBAction func stepper(_ sender: UIStepper) {
        edad.text = String(Int(sender.value))
    }
    
    
    @IBOutlet weak var nombreApellido: UITextField!
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var popUp: UIButton!
    @IBOutlet weak var SexoUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUp()
        
    }
    
    func setPopUp() {
        let opcion = {(action: UIAction) in print(action.title)}
        
        let opcion2 = {(action: UIAction) in print(action.title)}
        
        popUp.menu = UIMenu(children : [
            UIAction(title: "Casado", state: .on, handler: opcion),
            UIAction(title: "Soltero", handler: opcion),
            UIAction(title: "Divorciado", handler: opcion)])
        popUp.showsMenuAsPrimaryAction = true
        popUp.changesSelectionAsPrimaryAction = true
        
        SexoUp.menu = UIMenu(children : [
            UIAction(title: "Masculino", state: .on, handler: opcion2),
            UIAction(title: "Femenino", handler: opcion2),
            UIAction(title: "Otro", handler: opcion2)])
        SexoUp.showsMenuAsPrimaryAction = true
        SexoUp.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func confirmarFormulario(_ sender: Any) {
        falloNombre = false
        falloDni = false
    
        comprobarNombreApellido()
        comprobarDni()
        
        if !falloNombre && !falloDni {
            performSegue(withIdentifier: "primera", sender: sender)
        }
    }
    
    func comprobarNombreApellido() {
        for p in nombreApellido.text! {
            if p.isNumber {
                falloNombre = true
                break
            }
        }
        
        if falloNombre {
            nombreApellido.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.4)
        } else {
            nombreApellido.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func comprobarDni() {
        if dni.text!.count != 9 {
            falloDni = true
        }
        var contador: Int = 0
        for p in dni.text! {
            contador += 1
            if !p.isNumber && contador < 8 {
                print("tiene que ser numero")
                falloDni = true
                break
            }
            if p.isNumber && contador > 8 {
                print("tiene que ser una letra")
                falloDni = true
                break
            }
        }
        
        if falloDni {
            dni.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.4)
        } else {
            dni.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "primera" {
            let vc = segue.destination as? segundaSwift
            vc!.nombreSegunda = nombreApellido.text!
            vc!.dniSegunda = dni.text!
            vc!.edadSegunda = Int(edad.text!)!
            vc!.civilSegunda = popUp.titleLabel!.text!
            vc!.sexoSegunda = SexoUp.titleLabel!.text!
        }
    }
    
}

