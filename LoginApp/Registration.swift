import UIKit

class Registration: UIViewController {

    @IBOutlet weak var registerUser: UITextField!
    @IBOutlet weak var registerPass: UITextField!
    @IBAction func registerAccount(_ sender: Any) {
        if (registerUser.text == "") {
            showMsgDialog(dialogMsg: "Please enter your username", dialogTitle: "Error")
        } else if (registerPass.text == "") {
            showMsgDialog(dialogMsg: "Please enter your password", dialogTitle: "Error")
        } else {
            UserDefaults.standard.set([registerUser.text, registerPass.text], forKey: "account")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func showMsgDialog(dialogMsg: String, dialogTitle: String) {
        let alert = UIAlertController(title: dialogTitle, message: dialogMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
