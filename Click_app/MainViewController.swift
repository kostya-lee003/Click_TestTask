//
//  MainViewController.swift
//  Click_TestTask
//
//  Created by Kostya Lee on 28/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items = [
        MainViewModel(title: "Оплата", image: UIImage(systemName: "dollarsign.square")!),
        MainViewModel(title: "Переводы", image: UIImage(systemName: "tray.and.arrow.up")!),
        MainViewModel(title: "Мои счета", image: UIImage(systemName: "list.bullet.rectangle")!),
        MainViewModel(title: "Click PASS", image: UIImage(systemName: "app.badge.checkmark")!),
        MainViewModel(title: "QR сканер", image: UIImage(systemName: "qrcode")!),
        MainViewModel(title: "История", image: UIImage(systemName: "clock.arrow.circlepath")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.layer.sublayers?.forEach({
            $0.removeFromSuperlayer()
        })
    }
    
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 62, green: 65, blue: 80).cgColor
        let colorBottom = UIColor(red: 47, green: 49, blue: 61).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setCollectionView() {
        
        let nibCell = UINib(nibName: CustomCollectionCell.id, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: CustomCollectionCell.id)
        collectionView.backgroundColor = .clear
    }
    
    public func updateItems(with items: [MainViewModel]) {
        self.items = items
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 10.0
        return UIEdgeInsets(top: inset, left: inset*2, bottom: inset, right: inset*Double(items.count + 1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 130.0, height: 150.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.id, for: indexPath) as? CustomCollectionCell {
            let item = items[indexPath.row]
            cell.updateModel(item)
            cell.addShadow()
            cell.layer.cornerRadius = 7.0
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row].title)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//
//    }
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//    }
}
