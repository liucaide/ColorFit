//Created  on 2019/9/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */


import Foundation
import UIKit


private func fit_swizzling(_ cls:AnyClass?, original:Selector, swizzled:Selector) {
    guard let originalMethod = class_getInstanceMethod(cls, original),
        let swizzledMethod = class_getInstanceMethod(cls, swizzled) else {
        return
    }
    let didAdd = class_addMethod(cls, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    if didAdd {
        class_replaceMethod(cls, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

extension UILabel {
    @objc public static func cd_methodSwizzlingLabel() {
        fit_swizzling(self, original: #selector(awakeFromNib), swizzled: #selector(swizzling_awakeFromNib))
        fit_swizzling(self, original: #selector(setter: textColor), swizzled: #selector(setter: swizzling_textColor))
    }
    @objc private func swizzling_awakeFromNib() {
        swizzling_awakeFromNib()
        let color = self.textColor
        self.textColor = color
    }
    @objc private var swizzling_textColor:UIColor {
        set{
            let color = newValue.fit_textColor
            self.swizzling_textColor = color
        }
        get{
            return textColor
        }
    }
}


extension UIView {
    @objc public static func cd_methodSwizzling() {
        fit_swizzling(self, original: #selector(awakeFromNib), swizzled: #selector(swizzling_awakeFromNibView))
        fit_swizzling(self, original: #selector(setter: backgroundColor), swizzled: #selector(setter: swizzling_backgroundColor))
    }
    @objc private func swizzling_awakeFromNibView() {
        swizzling_awakeFromNibView()
        let color = self.backgroundColor
        self.backgroundColor = color
    }
    @objc private var swizzling_backgroundColor:UIColor? {
        set{
            let color = newValue?.fit_backgroundColor ?? backgroundColor
            self.swizzling_backgroundColor = color
        }
        get{
            return backgroundColor
        }
    }
}


extension UIViewController {
    @objc public static func cd_methodSwizzling() {
        fit_swizzling(UIViewController.self, original: #selector(viewWillAppear(_:)), swizzled: #selector(swizzling_viewWillAppear(_:)))
    }
    
    @objc private func swizzling_viewWillAppear(_ animated: Bool) {
        swizzling_viewWillAppear(animated)
    }
}
