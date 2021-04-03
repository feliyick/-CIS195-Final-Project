//
//  CheckBox.swift
//  timely
//
//  Created by user192427 on 4/2/21.
//

import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checkmark.square.filled")
    let uncheckedImage = UIImage(named: "checkmark.square")
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
