//Created  on 2020/3/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




import UIKit




class ViewController: UIViewController {
    @IBOutlet weak var lab_title: UILabel!// sb 默认颜色
    @IBOutlet weak var lab_title1: UILabel!// sb 指定 black
    @IBOutlet weak var lab_title2: UILabel!// sb 指定 自定义选色
    @IBOutlet weak var lab_title3: UILabel! // sb 指定 hex
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
        
        lab_title.backgroundColor = .clear//UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1)
        print(lab_title.textColor.rgba)
    }
    
    @IBAction func buttonClick(_ sender: UIButton ) {
        sender.isSelected = !sender.isSelected
        sender.setTitleColor(.red, for: .normal)
        if sender.isSelected {
            lab_title.textColor = UIColor.green
            lab_title1.textColor = UIColor.yellow
            lab_title2.textColor = UIColor.blue
            lab_title3.textColor = UIColor.red
            
            self.view.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
            lab_title.backgroundColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1)
            
            lab_title2.layer.borderWidth = 2
            lab_title2.layer.borderColor = UIColor.red.cgColor
            
        }else{
            lab_title.textColor = UIColor.black
            lab_title1.textColor = UIColor.black
            lab_title2.textColor = UIColor.black
            lab_title3.textColor = UIColor.black
            
            self.view.backgroundColor = .white
            lab_title.backgroundColor = .clear
            
            lab_title2.layer.borderWidth = 2
            lab_title2.layer.borderColor = UIColor.blue.cgColor
            
        }
        
        
    }
}

