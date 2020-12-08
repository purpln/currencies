//
//  LandingController.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import UIKit

class ViewController:UIViewController{
    var presenter: Protocol?
    let constants: Constants = Constants()
    var type: Types?
    var dataArray:[String] = []
    var response:Response? = nil
    
    var tableView:UITableView!
    
    let btcusdt = UIButton()
    let bnbbtc = UIButton()
    let ethbtc = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        swipes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.selectType()
        presenter?.selectCurrency(.btcusdt)
    }
    
    @objc func selection(_ sender: UIButton) {
        switch sender.tag{
        case 1: presenter?.selectCurrency(.btcusdt)
        case 2: presenter?.selectCurrency(.bnbbtc)
        case 3: presenter?.selectCurrency(.ethbtc)
        default: return
        }
    }
    
    private func swipes(){
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc private func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            tabBarController!.selectedIndex -= 1
        }
    }
}

extension ViewController: ViewProtocol{
    func data(_ response: Response?) {
        self.response = response
        tableView?.reloadData()
    }
    
    func tabBar(_ type: Types?) {
        self.type = type
        
        switch type{
        case .bid: tabBarController?.tabBar.tintColor = .systemGreen
        case .ask: tabBarController?.tabBar.tintColor = .systemRed
        case .detail: tabBarController?.tabBar.tintColor = .systemBlue
        default: return
        }
    }
}
