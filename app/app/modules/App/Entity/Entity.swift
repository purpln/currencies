//
//  Entity.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

enum Currencies:String{
    case btcusdt
    case bnbbtc
    case ethbtc
    
    var cappitalized:String{
        switch self {
        case .bnbbtc: return "BTCUSDT"
        case .btcusdt: return "BNBBTC"
        case .ethbtc: return "ETHBTC"
        }
    }
}

enum Types{
    case bid
    case ask
    case detail
}

struct Response:Codable{
    var e:String
    var E:Int
    var s:String
    var U:Int
    var u:Int
    var b:[[String]]
    var a:[[String]]
}
