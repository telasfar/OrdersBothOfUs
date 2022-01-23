//
//  Constants.swift
//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//

import Foundation

class Constants{

static let URL_CURRENT_ORDER = "URL_CURRENT_ORDER"
static let URL_PAST_ORDER = "URL_PAST_ORDER"
    //[0:imgWaitCheckout,1:imgCheckoutconfirm,2:imgCheckoutReady,3:imgCheckOutDone]
static let currentOderArr:[Order] = [
    Order(deliveryAddress: "Egypt", deliveryCharge: "50", deliveryTimeFrom: "1 FEB", deliveryTimeTo: "11 FEB", currentStatus: "BOOKED", onDate: "1 FEB", paymentMethod: "Visa", status: "0", totalAmount: "70", totalItems: 3, orderId: "112", productArr: [
       Product(price: "10", productId: "20", productImage: "banana", productName: "Banana", qty: 2),
      Product(price: "20", productId: "12", productImage: "mango", productName: "Mango", qty: 2),
     Product(price: "10", productId: "13", productImage: "orange", productName: "Orange", qty: 1)],isPastOrder:false),
    
    Order(deliveryAddress: "UAE", deliveryCharge: "100", deliveryTimeFrom: "3 FEB", deliveryTimeTo: "14 FEB", currentStatus: "CONFIRMED", onDate: "1 FEB", paymentMethod: "Cash", status: "1", totalAmount: "170", totalItems: 3, orderId: "113", productArr: [
       Product(price: "50", productId: "20", productImage: "lights", productName: "Light", qty: 2),
      Product(price: "20", productId: "12", productImage: "modernChair", productName: "Modern Chair", qty: 2),
     Product(price: "30", productId: "13", productImage: "classicChair", productName: "Classic Chair", qty: 1)],isPastOrder:false),
    
    Order(deliveryAddress: "Egypt", deliveryCharge: "50", deliveryTimeFrom: "11 FEB", deliveryTimeTo: "12 FEB", currentStatus: "READY", onDate: "12 FEB", paymentMethod: "Visa", status: "2", totalAmount: "500", totalItems: 2, orderId: "114", productArr: [
       Product(price: "15", productId: "20", productImage: "pen", productName: "Pen", qty: 1),
      Product(price: "20", productId: "12", productImage: "pencil", productName: "Pencil", qty: 1)],isPastOrder:false)
]


static let previousOderArr:[Order] = [
    Order(deliveryAddress: "Egypt", deliveryCharge: "50", deliveryTimeFrom: "1 FEB", deliveryTimeTo: "11 FEB", currentStatus: "DELIVERED", onDate: "1 FEB", paymentMethod: "Cash", status: "3", totalAmount: "70", totalItems: 3, orderId: "12", productArr: [
       Product(price: "10", productId: "20", productImage: "banana", productName: "Banana", qty: 2),
      Product(price: "20", productId: "12", productImage: "mango", productName: "Mango", qty: 2),
     Product(price: "10", productId: "13", productImage: "orange", productName: "Orange", qty: 1)],isPastOrder:true),
    
    Order(deliveryAddress: "Egypt", deliveryCharge: "100", deliveryTimeFrom: "3 FEB", deliveryTimeTo: "14 FEB", currentStatus: "DELIVERED", onDate: "1 FEB", paymentMethod: "Visa", status: "3", totalAmount: "170", totalItems: 5, orderId: "13", productArr: [
       Product(price: "50", productId: "20", productImage: "lights", productName: "Light", qty: 2),
      Product(price: "20", productId: "12", productImage: "modernChair", productName: "Modern Chair", qty: 2),
            Product(price: "30", productId: "13", productImage: "classicChair", productName: "Classic Chair", qty: 1)],isPastOrder:true),
    
    Order(deliveryAddress: "Egypt", deliveryCharge: "50", deliveryTimeFrom: "11 FEB", deliveryTimeTo: "12 FEB", currentStatus: "DELIVERED", onDate: "12 FEB", paymentMethod: "Cash", status: "3", totalAmount: "500", totalItems: 2, orderId: "14", productArr: [
       Product(price: "15", productId: "20", productImage: "pen", productName: "Pen", qty: 1),
      Product(price: "20", productId: "12", productImage: "pencil", productName: "Pencil", qty: 1)],isPastOrder:true),
    
    Order(deliveryAddress: "USA", deliveryCharge: "150", deliveryTimeFrom: "21 JUN", deliveryTimeTo: "31 JUN", currentStatus: "CANCELLED", onDate: "1 JUN", paymentMethod: "Visa", status: "4", totalAmount: "500", totalItems: 2, orderId: "15", productArr: [
       Product(price: "15", productId: "20", productImage: "dress", productName: "Dress", qty: 1),
      Product(price: "20", productId: "12", productImage: "jacket", productName: "Jacket", qty: 1),],isPastOrder:true)
]
}
