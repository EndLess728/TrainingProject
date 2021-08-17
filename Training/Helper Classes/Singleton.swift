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
    
    var window: UIWindow?
    var spinnerView = UIView()
    var activityIndicatorImageView = UIImageView()
    let mainBackBlurView: UIView = UIView()
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView()
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    let screenHight = UIScreen.main.bounds.height
    var rotateActivtiyIndicator : Bool = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
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

