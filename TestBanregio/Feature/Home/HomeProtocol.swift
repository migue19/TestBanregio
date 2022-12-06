//
//  HomeProtocol.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//  
//

/// Protocolo que define los métodos y atributos para el view de Home
/// PRESENTER -> VIEW
protocol HomeViewProtocol {
}
/// Protocolo que define los métodos y atributos para el routing de Home
/// PRESENTER -> ROUTING
protocol HomeRouterProtocol {
}
/// Protocolo que define los métodos y atributos para el Presenter de Home
/// VIEW -> PRESENTER
protocol HomePresenterProtocol {
    func getData()
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
/// PRESENTER -> INTERACTOR
protocol HomeInteractorInputProtocol {
    func requestData()
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
/// INTERACTOR -> PRESENTER
protocol HomeInteractorOutputProtocol {
}
