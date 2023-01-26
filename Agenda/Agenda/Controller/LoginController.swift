import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var incorrect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrect.isHidden = true
    }
    @IBAction func loginButton(_ sender: Any) {
        if username.text?.isEmpty == false && password.text?.isEmpty == false{

            guard let url = URL(string:"https://superapi.netlify.app/api/login")
            else {
                return
            }
            // Le damos los datos del Diccionario.
            let body: [String: String] = ["user": username.text!, "pass": password.text!]
            var request = URLRequest(url: url)
            
            // Creamos una variable de User para guardarla de manera local
            let user = User(nombre: username.text!)
            
            // Pasamos a Json el Diccionario.
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpMethod = "POST"
            request.httpBody = finalBody // 
            
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print("\n RESPONSE LOGIN: \n", response as Any)
                // Imprime el error en caso de que haya un fallo
                if let error = error {
                    print("\n ERROR: \n", error)
                    return
                }
                guard let data = data else{
                    print("Error al recibir data.")
                    return
                }
                
                // Te devuelve la respuesta del servidor.
                print("\nDATA LOGIN:\n",data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
                if String(data: data, encoding: .utf8) == "Login succesful" {
                    DispatchQueue.main.async {
                        user.saveUser() // Guardamos el usuario creado anteriormente.
                        self.performSegue(withIdentifier: "login", sender: sender)
                    }
                }
                else {
                    self.incorrect.isHidden = false // Damos un mensaje de error al usuario.
                }
            }.resume()
        }
        else {
            if username.text?.isEmpty == true {
                username.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
            if password.text?.isEmpty == true{
                password.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
            print("Error")
        }
    }
}
