//
//  CustomTableCell.swift
//  Click_app
//
//  Created by Kostya Lee on 01/03/23.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    static let id = String(describing: CustomTableCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var _imageView: UIImageView!
    
    @IBOutlet weak var _backgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor(red: 33, green: 36, blue: 47)
        _backgroundView.backgroundColor = UIColor(red: 58, green: 59, blue: 74)
        _imageView.tintColor = .white
        backgroundView?.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func updateModel(with model: PayViewModel) {
        self.titleLabel.text = model.title
        self._imageView.image = model.image
    }
}
