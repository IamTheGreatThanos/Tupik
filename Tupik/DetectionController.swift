import UIKit

class DetectionController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var stateNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func detectButton(_ sender: UIButton) {
        if stateNumber.text!.count == 9{
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "SendMessageController") as! SendMessageController

            self.present(mainTabController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Sorry", message: "Car number isn't valid!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
