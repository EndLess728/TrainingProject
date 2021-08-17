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
        clearFields()
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
            
            switch (response.result) {
            
            case .success( _):
                print("check resp",response.result)
                if let data = response.data {
                    do{
                        let userResponse = try JSONDecoder().decode(LoginModel.self, from: data)
                        
                        switch userResponse.success {
                        case true:
                            defaults.setToken(value: userResponse.data!.token!)
                            defaults.setLoggedIn(value: true)
                            
                            let homeScreeen = self.storyboard!.instantiateViewController(withIdentifier :"HomeScreenViewController") as! HomeScreenViewController
                            self.navigationController?.pushViewController(homeScreeen, animated: true)
                            
                        case false:
                            MAlertClass.showAlertView(vc: self, titleString: "Error", messageString:userResponse.message)
                            
                        }
                        
                        
                    } catch let err {
                        print("Error",err.localizedDescription)
                    }
                }
                
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

