//
//  CustomToDoListCellTableViewCell.swift
//  timely
//
//  Created by user192427 on 4/2/21.
//

import UIKit

protocol completeTaskDelegate: class {
    func didToggle(_ checkmark: UIButton) -> Bool
}
class ToDoCell: UITableViewCell {
    let checkedImage = UIImage(named: "checkmark.square.filled")
    let uncheckedImage = UIImage(named: "checkmark.square")
    
    @IBAction func tappedCheckbox(_ sender: UIButton) {
        if (sender.backgroundImage(for: .normal) == checkedImage) {
            sender.setBackgroundImage(uncheckedImage, for: .normal)
        } else {
            sender.setBackgroundImage(checkedImage, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
