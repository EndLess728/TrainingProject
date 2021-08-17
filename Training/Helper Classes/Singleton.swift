//
//  Singleton.swift
//  Training
//
//  Created by IOS on 16/08/21.
//

import NVActivityIndicatorView
import UIKit

class Singleton: NSObject {
    
    static let sharedInstance = Singleton()
    
    func convertToJSONString(value: AnyObject) -> String? {
        if JSONSerialization.isValidJSONObject(value) {
            do{
                let data = try JSONSerialization.data(withJSONObject: value, options: [])
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            }catch{
            }
        }
        return nil
    }
    
}

