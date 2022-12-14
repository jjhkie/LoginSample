
import UIKit
import FirebaseAuth

class MainViewController: UIViewController{
    
    @IBOutlet weak var welcomLabel: UILabel!
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //해당 화면이동 후
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        

        
        let email = Auth.auth().currentUser?.email ?? "고객"
        welcomLabel.text = """
        환영합니다. \(email)님
        """
        
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPasswordButton.isHidden = !isEmailSignIn
    }
    //password 재설정 메일 보내기 
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        
        do{
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("Error: SignOut Error \(signOutError.localizedDescription)")
        }

    }
}
