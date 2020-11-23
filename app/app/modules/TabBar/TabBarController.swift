//
//  TabBarController.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import UIKit

final class TabBarController: UITabBarController{
    init(_ tabs:[UIViewController]){
        super.init(nibName: nil, bundle: nil)
        viewControllers = tabs
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.title = Constants().appTitle
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
