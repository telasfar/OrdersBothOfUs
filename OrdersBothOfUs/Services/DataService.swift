//
//  DataService.swift
//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//

import Foundation

class DataService{
    
    //typealias
    typealias complitionOrders = (_ status:Bool,_ address:[Order]?)->()
    
    //singelton
    static let instance = DataService()
    
    func getPastOrders(complition: @escaping complitionOrders){
        if Storage.fileExists(Constants.URL_PAST_ORDER, in: .documents){
            let orderArr = Storage.retrieve(Constants.URL_PAST_ORDER, from: .documents, as: [Order].self)
            complition(true,orderArr)
        }else{
            Storage.store(Constants.previousOderArr, to: .documents, as: Constants.URL_PAST_ORDER)
            complition(true,Constants.previousOderArr)
        }
    }
    
    func getCurrentOrders(complition: @escaping complitionOrders){
        if Storage.fileExists(Constants.URL_CURRENT_ORDER, in: .documents){
            let orderArr = Storage.retrieve(Constants.URL_CURRENT_ORDER, from: .documents, as: [Order].self)
            complition(true,orderArr)
        }else{
            Storage.store(Constants.currentOderArr, to: .documents, as: Constants.URL_CURRENT_ORDER)
            complition(true,Constants.currentOderArr)
        }
    }
    
    func movePastOrderToCurrent(order:Order){
        var modifiedOrder = order
        modifiedOrder.status = "0"
        modifiedOrder.currentStatus = "BOOKED"
        var currentOrederArr = Storage.retrieve(Constants.URL_CURRENT_ORDER, from: .documents, as: [Order].self)
        var pastOrderArr = Storage.retrieve(Constants.URL_PAST_ORDER, from: .documents, as: [Order].self)
        pastOrderArr = pastOrderArr.filter{$0.orderId == modifiedOrder.orderId}
        currentOrederArr.append(modifiedOrder)
        removeArrays()
        Storage.store(currentOrederArr, to: .documents, as: Constants.URL_CURRENT_ORDER)
        Storage.store(pastOrderArr, to: .documents, as: Constants.URL_PAST_ORDER)
    }
    
    func resetArrays(){
        removeArrays()
        Storage.store(Constants.currentOderArr, to: .documents, as: Constants.URL_CURRENT_ORDER)
        Storage.store(Constants.previousOderArr, to: .documents, as: Constants.URL_PAST_ORDER)
    }
    
    func removeArrays(){
        Storage.remove(Constants.URL_PAST_ORDER, from: .documents)
        Storage.remove(Constants.URL_CURRENT_ORDER, from: .documents)
    }
}
