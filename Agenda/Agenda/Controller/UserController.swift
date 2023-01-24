import UIKit
import Photos

class UserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var image: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        let user: User = User.loadUser()!
        userName.text = user.name
    }
    
    // Creamos una funcion para activar el ImagePicker.
    @IBAction func changeImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // Creamos la funcion para el funcionamiento del ImagePicker.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        image.image = img
        self.dismiss(animated: true, completion: nil) // Cierra la galería al elejir foto.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { // Si se cancela, regresa de nuevo.
        self.dismiss(animated: true, completion: nil)
    }
}
