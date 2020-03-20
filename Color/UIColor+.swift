//Created  on 2020/3/18 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




import Foundation
import UIKit

extension UIColor {
    public var hex:String {
        let rgba = self.rgba
        let rs:String = String(Int(rgba.0*255), radix: 16)
        let gs:String = String(Int(rgba.1*255), radix: 16)
        let bs:String = String(Int(rgba.2*255), radix: 16)
        return "#" + rs + gs + bs
    }
    
    public var rgba:(CGFloat,CGFloat,CGFloat,CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }
    
    static func colorFit(_ light:UIColor, dark:UIColor? = nil) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (tr) -> UIColor in
                switch tr.userInterfaceStyle {
                case .light:
                    return light
                case .dark:
                    return dark ?? light
                default:
                    return light
                }
            }
        } else {
            return light
        }
    }
   
    /*
    static func hex(_ light:String, dark:String? = nil) -> UIColor {
        return
    }*/
    
    
}
