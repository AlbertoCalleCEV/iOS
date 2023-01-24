import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        if name.text?.isEmpty == false && password.text?.isEmpty == false && cpassword.text == password.text {
            
            guard let url = URL(string:"https://superapi.netlify.app/api/register")
            else {
                return
            }
            // Le damos los datos del Array.
            let body: [String: String] = ["user": name.text!, "pass": password.text!]
            var request = URLRequest(url: url)
            
            // Creamos una variable de User para guardarla de manera local
            let user = User(nombre: name.text!)
            
            // Pasamos a Json el Array.
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpMethod = "POST"
            request.httpBody = finalBody //
            
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print(response as Any)
                if let error = error {
                    print(error)
                    return
                } else {
                    DispatchQueue.main.async {
                        user.saveUser() // ???
                        self.performSegue(withIdentifier: "register", sender: sender)
                    }
                }
                guard let data = data else{
                    print("Error al recivir data.")
                    return
                }
                
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
                
                
            }.resume()
        }
        else {
            if name.text?.isEmpty == true {
                name.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
            if password.text != cpassword.text && password.text?.isEmpty == false{
                password.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                cpassword.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
            
            print("Error")
        }
    }
}
