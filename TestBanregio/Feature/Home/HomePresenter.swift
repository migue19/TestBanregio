//
//  HomePresenter.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//  
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
}
extension HomePresenter: HomePresenterProtocol {
    func getData() {
        interactor?.requestData()
    }
    
}
extension HomePresenter: HomeInteractorOutputProtocol {
}
