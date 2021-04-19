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
    
    @IBInspectable var highlightedSelectedImage:UIImage?
    
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
        self.setImage(highlightedSelectedImage, for: [.highlighted, .selected])
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        isSelected.toggle()
    }

}
