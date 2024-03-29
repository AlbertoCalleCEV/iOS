import UIKit

class AddEventController: UIViewController {
    
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addEventButton(_ sender: Any) {
        let date = datePicker.date
        let dateseconds = Int(date.timeIntervalSince1970)
        
        if eventName.text?.isEmpty == false {
            
            // URL para hacer el GET.
            guard let url = URL(string:"https://superapi.netlify.app/api/db/eventos")
            else {
                return
            }
            // Le damos los datos del Array.
            let body: [String: Any] = ["name": eventName.text!, "date": dateseconds]
            var request = URLRequest(url: url)
            
            // Pasamos a Json el Array.
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpMethod = "POST"
            request.httpBody = finalBody //
            
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print(response as Any)
                // Imprime el error en caso de que haya un fallo
                if let error = error {
                    print(error)
                    return
                } else {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                guard let data = data else{
                    print("Error al recivir data.")
                    return
                }
                print("\n\n\n")
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
            }.resume()
        }
    }
}
