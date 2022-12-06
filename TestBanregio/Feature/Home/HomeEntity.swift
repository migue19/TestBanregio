//
//  HomeEntity.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//

import Foundation

struct Loan {
    var loanId: String
    var client: Int
    var date: Date
    var amount: Double
    var status: StateClient
}


struct Account {
    var cliente: String
    var amount: Double
    var state: StateAccount
}

struct AmountParams {
    var currentDate: Date
    var tasaInteres: Double
    var tasaIva: Double
    var daysComercialYear: Int
}

enum StateAccount {
    case active
    case block
    case cancel
}


enum StateClient: String {
    case pending
    case paid
}
