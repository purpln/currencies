//
//  TabBarRouter.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import UIKit

final class TabBarRouter{
    static let constants:Constants = Constants()
    
    static func create() -> UITabBarController{
        let bidIcon = UIImage(systemName: constants.tabBarBidIcon)
        let askIcon = UIImage(systemName: constants.tabBarAskIcon)
        let detailsIcon = UIImage(systemName: constants.tabBarDetailsIcon)
        
        let bid = Router.type(.bid)
        let ask = Router.type(.ask)
        let detail = Router.type(.detail)
        
        bid.tabBarItem = UITabBarItem(title: constants.tabBarBidTitle, image: bidIcon, tag: 1)
        ask.tabBarItem = UITabBarItem(title: constants.tabBarAskTitle, image: askIcon, tag: 2)
        detail.tabBarItem = UITabBarItem(title: constants.tabBarDetailTitle, image: detailsIcon, tag: 3)
        
        let tabBarConroller = TabBarController([bid, ask, detail])
        
        return tabBarConroller
    }
}
