//
//  Router.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import Foundation

final class Router: RouterProtocol{
    static func type(_ type: Types?) -> ViewController{
        let view = ViewController()
        
        let presenter: Protocol = Presenter()
        let interactor: InteractorProtocol = Interactor()
        let router: RouterProtocol = Router()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.type = type
        
        return view
    }
}
