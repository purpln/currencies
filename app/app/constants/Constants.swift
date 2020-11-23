//
//  Constants.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import UIKit

final class Constants{
    let socketUrl = "wss://stream.binance.com:9443/ws/"
    let socketDelay = "@depth@1000ms"
    
    let zero = "0.0"
    let padding:CGFloat = 20
    let cell = "Cell"
    
    let appTitle = "Test Aplication"
    
    let tabBarBidIcon = "plus.circle.fill"
    let tabBarAskIcon = "minus.circle.fill"
    let tabBarDetailsIcon = "info.circle.fill"
    
    let tabBarBidTitle = "info: Bid"
    let tabBarAskTitle = "info: Ask"
    let tabBarDetailTitle = "Detail"
    
    let bidCell = "bidCell"
    let askCell = "askCell"
    let detailCell = "detailCell"
}
