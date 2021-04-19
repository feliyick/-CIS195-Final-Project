//
//  CustomToDoListCellTableViewCell.swift
//  timely
//
//  Created by user192427 on 4/2/21.
//

import UIKit

protocol completeTaskDelegate: class {
    func didToggle(_ checkmark: CheckBox) -> Bool
}
class ToDoCell: UITableViewCell {
    let checkedImage = UIImage(named: "checkmark.square.filled")
    let uncheckedImage = UIImage(named: "checkmark.square")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
