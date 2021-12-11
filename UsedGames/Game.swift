//
//  Game.swift
//  UsedGames
//
//  Created by Berat Yavuz on 24.10.2021.
//

import Foundation
//nsobject en tepedeki class yani kalıtım için
class Game:NSObject,Identifiable{

var name:String
var priceInDollars:Double
var serialNumber:String
var dateCreated:Date

// her game objesi oluşturulduğunda aşağıdaki de çalışacak
    init(name:String,priceInDollars:Double,serialNumber:String){
        
        self.name=name
        self.priceInDollars=priceInDollars
        self.serialNumber=serialNumber
        self.dateCreated=Date()
    }
    convenience init(random:Bool=false) {
        if random{
            let conditions = ["New","Mint","Used"]
            var idx = arc4random_uniform(UInt32(conditions.count))
            let randomCondition = conditions[Int(idx)]
            let names = ["Halo","Dishonered","Red Dead Redemption","God Of War","Resident Evil"]
            idx=arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
        idx=arc4random_uniform(UInt32(6))
            let randomTitle="\(randomCondition) \(randomName) \(Int(idx)) "
            let serialNumber = UUID().uuidString.components(separatedBy: "-").first!
            let priceInDollars = Double(arc4random_uniform(UInt32(70)))
            self.init(name:randomTitle,priceInDollars:priceInDollars, serialNumber:serialNumber)
        }
        else{
            self.init(name:"",priceInDollars:0,serialNumber:"")
        }
        
    }
}
