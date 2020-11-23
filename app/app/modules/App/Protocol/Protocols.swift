//
//  Protocol.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

protocol Protocol: class{
    var view: ViewProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    var router: RouterProtocol? { get set }
    var type: Types? { get set }
    
    func selectType()
    func selectCurrency(_ currency: Currencies?)
    func disconnect()
    
    func tabBar(_ type: Types?)
    func data(_ response: Response?)
}

protocol ViewProtocol: class{
    func tabBar(_ type: Types?)
    func data(_ response: Response?)
}

protocol InteractorProtocol: class{
    var presenter: Protocol? { get set }
    
    func selectType(_ type: Types?)
    func selectCurrency(_ currency: Currencies?)
    func disconnect()
}

protocol RouterProtocol: class{
    static func type(_ type: Types?) -> ViewController
}
