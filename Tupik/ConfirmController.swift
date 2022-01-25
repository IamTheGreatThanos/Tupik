import Foundation
import UIKit

class ConfirmController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var sendedCode: UITextField!
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        if sendedCode.text == "5555"{
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController

            mainTabController.selectedViewController = mainTabController.viewControllers?[1]

            self.present(mainTabController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Sorry", message: "Code isn't valid!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
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
