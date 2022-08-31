
import Foundation
import UIKit

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
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
}

extension EnterEmailViewController:UITextFieldDelegate{
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
