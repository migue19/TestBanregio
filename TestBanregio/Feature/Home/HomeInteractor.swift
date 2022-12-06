//
//  HomeInteractor.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//  
//
import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol?
}
extension HomeInteractor: HomeInteractorInputProtocol {
    func requestData() {
        let accounts = getAccounts()
        let loans = getLoans()
        let activeAccounts = getActiveAccount(accounts: accounts)
        let loansActive = getLoansBy(accounts: activeAccounts, loans: loans)
        let sortLoans = loansActive.sorted(by: {$0.date < $1.date })
        let params = AmountParams(currentDate: Date("15-feb-21"), tasaInteres: 0.75, tasaIva: 0.16, daysComercialYear: 360)
        processPay(loansActive: sortLoans, param: params, accounts: activeAccounts)
        //
        //let amount = getAmount(loanDate: Date("10-ene-21"), amount: 37500.00, params: params)
        //print(amount)
    }
    
    func processPay(loansActive: [Loan], param: AmountParams, accounts: [Account]) {
        for active in loansActive {
            let amount = getAmount(loanDate: active.date, amount: active.amount, params: param)
            let account = accounts.filter({ $0.cliente == active.loanId}).first
            let saldo = account?.amount ?? 0.0
            if saldo > amount {
                print("cliente: \(active.loanId) monto: \(amount) saldo: \(saldo) pagado")
                updateBalance(cliente: active.loanId, newbalance: saldo - amount)
            } else {
                print("cliente: \(active.loanId) monto: \(amount) saldo: \(saldo) saldo insuficiente")
            }
        }
    }
    
    func updateBalance(cliente: String, newbalance: Double) {
        print("Update balance")
    }
    
    func getActiveAccount(accounts: [Account]) -> [Account] {
        return accounts.filter({$0.state == .active})
    }
    
    func getLoansBy(accounts: [Account], loans: [Loan]) -> [Loan] {
        var newLoans: [Loan] = []
        for account in accounts {
            for loan in loans {
                if loan.loanId == account.cliente && loan.status == .pending {
                    newLoans.append(loan)
                }
            }
        }
        return newLoans
    }
    
    
    func getLoans() -> [Loan] {
        let loans = [
            Loan(loanId: "00103228", client: 1, date: Date("10-ene-21"), amount: 37500.00, status: .pending),
            Loan(loanId: "00103228", client: 2, date: Date("19-ene-21"), amount: 725.18, status: .pending),
            Loan(loanId: "00103228", client: 3, date: Date("31-ene-21"), amount: 1578.22, status: .pending),
            Loan(loanId: "00103228", client: 4, date: Date("04-feb-21"), amount: 380.00, status: .pending),
            
            Loan(loanId: "70099925", client: 1, date: Date("07-ene-21"), amount: 2175.25, status: .paid),
            Loan(loanId: "70099925", client: 2, date: Date("13-ene-21"), amount: 499.99, status: .paid),
            Loan(loanId: "70099925", client: 3, date: Date("24-ene-21"), amount: 5725.18, status: .pending),
            Loan(loanId: "70099925", client: 4, date: Date("07-feb-21"), amount: 876.13, status: .pending),
            
            Loan(loanId: "00298185", client: 1, date: Date("04-feb-21"), amount: 545.55, status: .pending),
            
            Loan(loanId: "15000125", client: 1, date: Date("31-dic-20"), amount: 15220.18, status: .paid),
        ]
        return loans
    }
    
    func getAmount(loanDate: Date, amount: Double, params: AmountParams) -> Double {
        let calendar = Calendar.current
        let plazo = calendar.numberOfDaysBetween(loanDate, and: params.currentDate)
        let interes = amount * Double(plazo) * params.tasaInteres / Double(params.daysComercialYear)
        let iva = interes * params.tasaIva
        let pago = amount + interes + iva
        return pago
    }
    
    func getAccounts() -> [Account] {
        let accounts = [
            Account(cliente: "00103228", amount: 15375.28, state: .active),
            Account(cliente: "70099925", amount: 3728.51, state: .block),
            Account(cliente: "00298185", amount: 0, state: .cancel),
            Account(cliente: "15000125", amount: 235.28, state: .active)
        ]
        return accounts
    }
}


extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "es_MX") as Locale
        let date = dateStringFormatter.date(from: dateString) ?? Date()
        self.init(timeInterval:0, since:date)
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
