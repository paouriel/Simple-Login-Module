import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func logoutBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let detailObjects = UserDefaults.standard.object(forKey: "account")
        if let details = detailObjects as? NSArray {
            nameLabel.text = "Hello, "+String(describing: details[0])
        }
        
        let formatter = DateFormatter()
        //formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy" // "4:44 PM on June 23, 2016\n"
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let dateString = formatter.string(from: Date())
        timeLabel.text = dateString

        /*let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        timeLabel.text = "\(hour):\(minutes):\(seconds)"*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
