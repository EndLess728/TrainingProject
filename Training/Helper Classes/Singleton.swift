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
    
    //MARK: - Show Activity Indicator
    
    func showActivityIndicator(view:UIView) {
        let midY = view.frame.height / 2
        let midX = view.frame.width / 2
              let frame = CGRect(x: midX, y: midY, width: 30, height: 30)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .audioEqualizer, color: .gray, padding: 0)
        activityIndicatorView.startAnimating()
        
    }
    
    //MARK: - Hide Activity Indicator
    
    func hideActivityIndicator(view:UIView){
        let midY = view.frame.height / 2
        let midX = view.frame.width / 2
              let frame = CGRect(x: midX, y: midY, width: 30, height: 30)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .audioEqualizer, color: .gray, padding: 0)
        activityIndicatorView.stopAnimating()
    }

    
}

