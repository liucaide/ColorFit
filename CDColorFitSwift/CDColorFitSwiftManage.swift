//Created  on 2020/4/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */


import Foundation
import UIKit

extension UIColor {
    var fit_textColor:UIColor {
        if self.description.contains("UIDynamicSystemColor") {
            return self
        }
        let rgba = self.rgba
        
        if (rgba.0, rgba.1, rgba.2) == (0,0,0) {
            return UIColor.colorFit(self, dark: UIColor(red: 0, green: 1, blue: 0, alpha: rgba.3))
        }
        if (rgba.0, rgba.1, rgba.2) == (0.2,0.2,0.2) {
            return UIColor.colorFit(self, dark: .white)
        }
        
        if (rgba.0, rgba.1, rgba.2) == (1,1,0) {
            return UIColor.colorFit(self, dark: .orange)
        }
        if (rgba.0, rgba.1, rgba.2) == (0,0,1) {
            return UIColor.colorFit(self, dark: .purple)
        }
        if (rgba.0, rgba.1, rgba.2) == (1,0,0) {
            return UIColor.colorFit(self, dark: .brown)
        }
        
        if String(format: "%.2f, %.2f, %.2f", rgba.0, rgba.1, rgba.2) == "0.32, 0.36, 0.45" {
            return UIColor.colorFit(self, dark: UIColor(red: 1, green: 0, blue: 0, alpha: rgba.3))
        }
        return self
    }
    
    var fit_backgroundColor:UIColor {
        if self.description.contains("UIDynamicSystemColor") {
            return self
        }
        let rgba = self.rgba
        if (rgba.0, rgba.1, rgba.2) == (1,1,1) {
            return UIColor.colorFit(self, dark: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: rgba.3))
        }
        if String(format: "%.2f, %.2f, %.2f", rgba.0, rgba.1, rgba.2) == "0.94, 0.94, 0.94" {
            return UIColor.colorFit(self, dark: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: rgba.3))
        }
        if String(format: "%.2f, %.2f, %.2f", rgba.0, rgba.1, rgba.2) == "0.83, 0.83, 0.83" {
            return UIColor.colorFit(self, dark: UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: rgba.3))
        }
        return UIColor.colorFit(self, dark: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: rgba.3))
    }
}






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
            return UIColor { (tr) -> UIColor in
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
}
