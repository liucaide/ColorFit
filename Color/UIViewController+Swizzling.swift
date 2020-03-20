//Created  on 2019/9/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */


import Foundation
import UIKit



infix operator <=>
private extension Selector {
    static func <=> (left: Selector, right: Selector) {
        if let originalMethod = class_getInstanceMethod(UIViewController.self, left),
            let swizzledMethod = class_getInstanceMethod(UIViewController.self, right) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
extension UIViewController {
    @objc public static func cd_methodSwizzling() {
        methodSwizzling
    }
}

extension UIViewController {
    static let methodSwizzling: Void = {
        #selector(viewDidLoad) <=> #selector(swizzling_viewDidLoad)
        //#selector(getter: modalPresentationStyle) <=> #selector(getter: swizzling_modalPresentationStyle)
    }()
    
    @objc var swizzling_modalPresentationStyle: UIModalPresentationStyle {
        return .fullScreen
    }
    
    @objc private func swizzling_viewDidLoad() {
        swizzling_viewDidLoad()
    }
}
