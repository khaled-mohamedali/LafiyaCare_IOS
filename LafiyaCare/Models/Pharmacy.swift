//
//  Pharmacy.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import Foundation
class Pharmacy: Codable, Identifiable{
    /*
     isEmergency
     name
     openHours
     phone
     placeId
     rating     */
    var address:Address?
    var isEmergency:Bool?
    var name:String?
    var openHours:String?
    var placeId:String?
    var phone:String?
    var rating:Double?
    

    
}
