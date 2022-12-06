//
//  HomeVC.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//  
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    var presenter: HomePresenterProtocol?
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        label.text = "Test Banregio"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    
    func getData() {
        presenter?.getData()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(lblTitle)
        lblTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
}
/// Protocolo para recibir datos del presenter.
extension HomeVC: HomeViewProtocol {
}
