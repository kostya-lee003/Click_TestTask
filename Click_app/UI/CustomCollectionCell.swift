//
//  CustomCollectionCell.swift
//  Click_app
//
//  Created by Kostya Lee on 01/03/23.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: CustomCollectionCell.self)

    @IBOutlet weak var _imageView: UIImageView!
    @IBOutlet weak var _titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _imageView.tintColor = .systemPink
        contentView.backgroundColor = UIColor(red: 56, green: 58, blue: 73)
    }
    
    public func updateModel(_ model: MainViewModel) {
        self._imageView.image = model.image
        self._titleLabel.text = model.title
    }
}
