//
//  SignUpViewController.swift
//  Training
//
//  Created by IOS on 13/08/21.
//

import UIKit
import Alamofire
class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: TextFieldExtension!
    @IBOutlet weak var passwordTxtField: TextFieldExtension!
    @IBOutlet weak var confirmPasswordTxtField: TextFieldExtension!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func clearFields(){
        self.emailTxtField.text = ""
        self.passwordTxtField.text = ""
        self.confirmPasswordTxtField.text = ""
    }
    
    
    func signupAPI(email:String,confirmpassword:String) {
        
        let dictionary = ["email":email,
                          "password":confirmpassword]
        
        AF.request(API_URL + "signup", method: .post, parameters: dictionary,encoder: JSONParameterEncoder.default).responseJSON { response in
            debugPrint(response)
            self.clearFields()

        }
        
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        
        if emailTxtField.text == "" {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter email")
        } else if emailTxtField.text!.isValidEmail() == false {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter valid email")
        } else if passwordTxtField.text == ""{
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter password")
        }else if passwordTxtField.text!.count < 8 {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"password must be of atleast 8 characters")
        } else if confirmPasswordTxtField.text == ""{
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter confirm password")
        } else if confirmPasswordTxtField.text != passwordTxtField.text {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"password and confirm password do not match")
        } else {
            signupAPI(email: emailTxtField.text!, confirmpassword: confirmPasswordTxtField.text!)
        }
        
    }
    
}
