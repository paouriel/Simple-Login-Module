import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginUser: UITextField!
    @IBOutlet weak var loginPass: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        if(loginUser.text == "") {
            showMsgDialog(dialogMsg: "Please enter your username", dialogTitle: "Error")
        } else if (loginPass.text == "") {
            showMsgDialog(dialogMsg: "Please enter your password", dialogTitle: "Error")
        } else {
            let detailObject = UserDefaults.standard.object(forKey: "account")
            if (UserDefaults.standard.object(forKey: "account") == nil) {
                showMsgDialog(dialogMsg: "Invalid credentials", dialogTitle: "Error")
            } else if let detail = detailObject as? NSArray {
                if(String(describing: detail[0]) == loginUser.text && String(describing: detail[1]) == loginPass.text) {
                    
                } else {
                    showMsgDialog(dialogMsg: "Invalid credentials", dialogTitle: "Error")
                }
            }
        }
    }
    
    func showMsgDialog(dialogMsg: String, dialogTitle: String) {
        let alert = UIAlertController(title: dialogTitle, message: dialogMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

