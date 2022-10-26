
import UIKit

class segundaSwift: UIViewController {
    var nombreSegunda : String = ""
    var edadSegunda : Int = 0
    var sexoSegunda : String = ""
    var civilSegunda : String = ""
    var dniSegunda : String = ""
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var dni: UILabel!
    @IBOutlet weak var civil: UILabel!
    @IBOutlet weak var sexo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = nombreSegunda
        edad.text = String(edadSegunda)
        dni.text = dniSegunda
        civil.text = civilSegunda
        sexo.text = sexoSegunda
    }
}
