import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButton(_ sender: Any) {
        if username.text?.isEmpty == false && password.text?.isEmpty == false{

            guard let url = URL(string:"https://superapi.netlify.app/api/login")
            else {
                return
            }
            // Le damos los datos del Array.
            let body: [String: String] = ["user": username.text!, "pass": password.text!]
            var request = URLRequest(url: url)
            
            // Pasamos a Json el Array.
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpMethod = "POST"
            request.httpBody = finalBody //
            
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print("\nRESPONSE LOGIN:\n", response as Any)
                if let error = error {
                    print("\nERROR:\n", error)
                    return
                }
                guard let data = data else{
                    print("Error al recibir data.")
                    return
                }
                
                print("\nDATA LOGIN:\n",data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
                if String(data: data, encoding: .utf8) == "Login succesful" {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "login", sender: sender)
                    }
                }
            }.resume()
        }
        else {
            print("Error")
        }
    }
}
