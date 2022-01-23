//
//  Order.swift
//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//

import Foundation
struct Order : Codable {
	let deliveryAddress : String?
	let deliveryCharge : String?
	let deliveryTimeFrom : String?
	let deliveryTimeTo : String?
	var currentStatus : String?
	let onDate : String?
	let paymentMethod : String?
	var status : String?
	let totalAmount : String?
	let totalItems : Int?
	let orderId : String?
    let productArr:[Product]?
    let isPastOrder:Bool?
}
