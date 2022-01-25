import Foundation
import UIKit

class RegistrationController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var carNumber: UITextField!
    
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(fullName.text!, forKey: "FullName")
        defaults.set(phoneNumber.text!, forKey: "PhoneNumber")
        defaults.set(carNumber.text!, forKey: "CarNumber")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
