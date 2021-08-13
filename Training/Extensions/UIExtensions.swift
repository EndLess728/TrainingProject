//
//  UIExtensions.swift
//  Training
//
//  Created by IOS on 13/08/21.
//

import UIKit

class UIExtensions: NSObject {

}

//MARK: Round Corners of UIView from specific sides
extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}

class myRoundImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }
    
}

@IBDesignable class RoundImage: UIImageView {
    
    //  self.layer.cornerRadius = self.frame.height / 2
    // self.layer.masksToBounds = false
    // self.clipsToBounds = true
    
    
    @IBInspectable lazy var isRoundRectButton : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
}



@IBDesignable class RoundButton: UIButton {
    
    
    @IBInspectable lazy var isRoundRectButton : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}

@IBDesignable class RoundView: UIView {

    @IBInspectable lazy var isRoundRectButton : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}



@IBDesignable class RoundLabel: UILabel {
    
    
    @IBInspectable lazy var isRoundRectButton : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}

@IBDesignable class BigSwitch: UISwitch {
    
    @IBInspectable var scale : CGFloat = 1{
        didSet{
            setup()
        }
    }
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }
    
    
}


@IBDesignable
class RoundedLabel: UILabel {
    
    var edgeInsets: UIEdgeInsets {
        if autoPadding {
            if cornerRadius == 0 {
                return UIEdgeInsets.zero
            } else {
                return UIEdgeInsets(top: 1, left: 4, bottom: 1, right: 4)
            }
        } else {
            return UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        }
    }
    
    @IBInspectable var horizontalPadding: CGFloat = 0
    @IBInspectable var verticalPadding: CGFloat = 0
    @IBInspectable var autoPadding: Bool = true
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edgeInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        
        let edgeInsets = self.edgeInsets
        size.width += edgeInsets.left + edgeInsets.right
        size.height += edgeInsets.top + edgeInsets.bottom
        
        return size
    }
    
}
