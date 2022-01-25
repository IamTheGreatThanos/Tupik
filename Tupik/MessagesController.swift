import UIKit
import Foundation

class MessagesController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    @IBOutlet weak var MyTable: UITableView!
    
    var Nums:[String] = []
    var Msg:[String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Msg.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(true)
           
           MyTable.reloadData()
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.senderNum.text = Nums[indexPath.row]
        cell.date.text = "17.11.2019"
        cell.messageLabel.text = Msg[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Nums = []
        self.Msg = []
        
        let url = URL(string: "https://hakaton3.herokuapp.com/tupic/")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        //Get response
        let task = URLSession.shared.dataTask(with: request, completionHandler:{(data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
//                print(json)
                let msg = json["status"] as! NSArray
                DispatchQueue.main.async {
                    for i in msg{
                        print(i)
                        self.Nums.append("ABC 007 | 02")
                        self.Msg.append(i as! String)
                    }
                }
//               
            }
            catch{
                print("Error")
            }
        })
        task.resume()
    }
}
