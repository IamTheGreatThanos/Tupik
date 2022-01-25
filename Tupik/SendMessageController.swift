
import Foundation
import UIKit

class SendMessageController: ViewController, UINavigationControllerDelegate, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePickerController : UIImagePickerController!
    
    enum ImageSource {
        case photoLibrary
        case camera
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
//        imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
//        imagePickerController.sourceType = .camera
//        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       imagePickerController.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    @IBAction func sendMessage(_ sender: UIButton) {
        let url = URL(string: "https://hakaton3.herokuapp.com/tupic/")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "msg=" + textView.text!
        request.httpBody = postString.data(using: .utf8)
        //Get response
        let task = URLSession.shared.dataTask(with: request, completionHandler:{(data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                let status = json["status"] as! String
                DispatchQueue.main.async {
                    if status == "ok"{
                        let alert = UIAlertController(title: "Successful!", message: "All data are valid!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        
                        let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController

                        mainTabController.selectedViewController = mainTabController.viewControllers?[1]

                        self.present(mainTabController, animated: true, completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Sorry", message: "Some data aren't valid!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    }
                }
            }
            catch{
                print("Error")
            }
        })
        task.resume()
    }
    
}
