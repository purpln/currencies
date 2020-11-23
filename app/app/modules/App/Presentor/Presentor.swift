//
//  Presentor.swift
//  app
//
//  Created by Sergey Romanenko on 21.11.2020.
//

import Foundation

final class Presenter: Protocol{
    var view: ViewProtocol?
    var router: RouterProtocol?
    var interactor: InteractorProtocol?
    
    var type: Types?
    
    func selectType(){
        interactor?.selectType(type)
    }
    
    func selectCurrency(_ currency: Currencies?){
        interactor?.selectCurrency(currency)
    }
    
    func disconnect() {
        interactor?.disconnect()
    }
    
    func tabBar(_ type: Types?) {
        view?.tabBar(type)
    }
    
    func data(_ response: Response?) {
        view?.data(response)
    }
}
