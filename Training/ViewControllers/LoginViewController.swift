//
//  ViewController.swift
//  Training
//
//  Created by IOS on 13/08/21.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: TextFieldExtension!
    @IBOutlet weak var passwordTxtField: TextFieldExtension!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func clearFields(){
        self.emailTxtField.text = ""
        self.passwordTxtField.text = ""
    }
    
    func signInAPI(email:String,password:String){
       
        
        let dictionary = ["email":email,
                          "password":password]
        
        AF.request(API_URL + "login", method: .post, parameters: dictionary,encoder: JSONParameterEncoder.default).responseJSON { response in
            debugPrint(response)
            
            print("result",response.result)
            print("resp",response.response)
            
            
            switch (response.result) {
            
            case .success( _):
                
               
                    print(response)
                    
                   let responseDict = response.value as! [String : Any]
                    // print(responseDict)
                    let status = responseDict["success"] as! [String : AnyObject]
                    print("statuscode",status)
                    
                    
              
                
            case .failure(let error):
                print("Request error: \(error.localizedDescription)")
            }
            
        }
    }
    
    
    @IBAction func signInBtnAction(_ sender: Any) {
        if emailTxtField.text == "" {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter email")
        } else if emailTxtField.text!.isValidEmail() == false {
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter valid email")
        } else if passwordTxtField.text == ""{
            MAlertClass.showAlertView(vc: self, titleString: "", messageString:"Please enter password")
        } else {
            signInAPI(email:emailTxtField.text!,password:passwordTxtField.text!)
        }
        
        
    }
    @IBAction func signupBtnAction(_ sender: Any) {
        let signupScreen = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signupScreen, animated: true)
    }
    
}

