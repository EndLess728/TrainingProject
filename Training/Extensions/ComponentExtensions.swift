//
//  ComponentExtensions.swift
//  Training
//
//  Created by IOS on 16/08/21.
//

import Foundation
import UIKit

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern:  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case token
}

extension UserDefaults{

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    //MARK: Save User Token
    func setToken(value: String){
        set(value, forKey: UserDefaultsKeys.token.rawValue)
       
    }

    //MARK: Retrieve User Token
    func getToken() -> String{
        return string(forKey:UserDefaultsKeys.token.rawValue) ?? ""
    }
}
