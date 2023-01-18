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
            
            // Pasamos a Json el Array
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpMethod = "POST"
            request.httpBody = finalBody //
            
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else{
                    return
                }
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
            }.resume()
        }
        else {
            print("Error")
        }
    }
}
