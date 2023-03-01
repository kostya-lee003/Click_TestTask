//
//  PayViewController.swift
//  Click_app
//
//  Created by Kostya Lee on 01/03/23.
//

import UIKit

class PayViewController: UIViewController {
    
    @IBOutlet weak var topOverlayView: UIView!
    
    @IBOutlet weak var bottomOverlayView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var items = [1, 2, 3, 4, 5, 5, 1, 2, 3, 4, 5, 5, 1, 2, 3, 4, 5, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    private func setView() {
        let bgColor = UIColor(red: 33, green: 36, blue: 47)
        self.view.backgroundColor = bgColor
        self.topOverlayView.backgroundColor = bgColor
        self.bottomOverlayView.backgroundColor = bgColor
        self.tableView.backgroundColor = .clear
        
        let nibCell = UINib(nibName: CustomTableCell.id, bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: CustomTableCell.id)
        tableView.contentInset = UIEdgeInsets(top: 80.0, left: 0, bottom: 60.0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        applyGradientMask()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        topOverlayView.layer.mask = nil
        bottomOverlayView.layer.mask = nil
        tableView.delegate = nil
        tableView.dataSource = nil
    }
    
    private func applyGradientMask() {
        let bmask = CAGradientLayer()
        bmask.startPoint = CGPointMake(0.5, 0.0)
        bmask.endPoint = CGPointMake(0.5, 1)
        let whiteColor = UIColor.white
        bmask.colors = [
            whiteColor.withAlphaComponent(0.0).cgColor,
            whiteColor.withAlphaComponent(1.0).cgColor
        ]
        bmask.locations = [
            NSNumber(value: 0.0),
            NSNumber(value: 0.5)
        ]
        bmask.frame = bottomOverlayView.bounds
        bottomOverlayView.layer.mask = bmask
        
        let tmask = CAGradientLayer()
        tmask.startPoint = CGPointMake(0.5, 1)
        tmask.endPoint = CGPointMake(0.5, 0.0)
        tmask.colors = [
            whiteColor.withAlphaComponent(0.0).cgColor,
            whiteColor.withAlphaComponent(1.0).cgColor
        ]
        tmask.locations = [
            NSNumber(value: 0.0),
            NSNumber(value: 0.3)
        ]
        tmask.frame = topOverlayView.bounds
        topOverlayView.layer.mask = tmask
    }
}

extension PayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.id, for: indexPath) as? CustomTableCell {
            cell.updateModel(with: PayViewModel(title: "Label", image: UIImage(systemName: "doc.richtext")!))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        94.0
    }
}
