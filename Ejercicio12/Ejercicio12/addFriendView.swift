import UIKit

class addFriendView: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var affinityText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func confirm(_ sender: Any) {
        let name = nameText.text
        let affinity = Int(affinityText.text!)
    
        if name != "" && affinity != nil {
            if affinity! <= 5 && affinity! >= 0 {
                affinityText.backgroundColor = UIColor.white
                nameText.backgroundColor = UIColor.white
                DataManager.friends.append(Friends(name: String(name!), affinity: String(affinity!)))
                DataManager.saveFriends()
                performSegue(withIdentifier: "confirm", sender: sender)
            } else {
                affinityText.backgroundColor = UIColor.red
            }
            
        } else {
            nameText.backgroundColor = UIColor.red
        }
    }
}
