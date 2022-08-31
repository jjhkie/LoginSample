
import UIKit
import FirebaseAuth

class EnterEmailViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 30
        
        loginButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //해당 화면에 들어왔을 떄 커서가 자동적로 설정되도록 하는 코드
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    //로그인 버튼을 눌렀을 떄 실행되는 코드
    @IBAction func loginButtonTap(_ sender: UIButton) {
        print("aaa")
        //Firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        print("aaa")
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                let code = (error as NSError).code
                switch code {
                case 17007: //이미 가입한 계정일 때
                    //로그인하기
                    self.loginUser(withEmail: email, password: password)
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            }else{
                self.showMainViewController()
            }
  
            
        }
    }
    


    private func showMainViewController(){
        let stroyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = stroyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){[weak self] _, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorMessageLabel.text = error.localizedDescription
            }else {
                self.showMainViewController()
            }
        }
    }
}

extension EnterEmailViewController: UITextFieldDelegate{
    //return 을 눌렀을 때 키보드가 내려가도록 설정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    //이메일과 비밀번호의 값이 있는 지 확인 후 버튼 활성화 설정
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        loginButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
