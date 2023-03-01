//
//  UICollectionViewCellExtension.swift
//  Click_app
//
//  Created by Kostya Lee on 01/03/23.
//

import UIKit

extension UICollectionViewCell {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 20.0
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false //<-
    }
}
