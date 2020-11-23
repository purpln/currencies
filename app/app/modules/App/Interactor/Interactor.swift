//
//  Interactor.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import Foundation

final class Interactor: NSObject{
    var presenter: Protocol?
    
    static let constants:Constants = Constants()
    
    private var session: URLSession!
    private var webSocketTask: URLSessionWebSocketTask!
    private var connected:Bool = false
    
    private var url = constants.socketUrl
    private var delay = constants.socketDelay
    private var type: Types?
    private var savedCurrency:Currencies?

    private func subscribe(){
        webSocketTask.receive {result in
            switch result{
            case .failure:return
            case .success(let message):
                switch message {
                case .string(let text):
                    let data:Data = text.data(using: .utf8)!
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Response.self, from: data){
                        DispatchQueue.main.async{
                            self.presenter?.data(json)
                        }
                    }
                case .data:return
                @unknown default:return
                }
            }
            self.subscribe()
        }
    }
    
    func reconnect(_ currency:Currencies){
        guard currency != savedCurrency else { return }
        savedCurrency = currency
        print(currency.rawValue)
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        webSocketTask = session.webSocketTask(with: URL(string: url + currency.rawValue + delay)!)
        webSocketTask.resume()
    }
    
    func ping() {
      webSocketTask.sendPing { error in
        if error == nil {
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                self.ping()
            }
        }
      }
    }
}

extension Interactor: URLSessionWebSocketDelegate, InteractorProtocol{
    func selectType(_ type: Types?){
        presenter?.tabBar(type)
    }
    
    func selectCurrency(_ currency: Currencies?) {
        reconnect(currency!)
    }
    
    func disconnect(){
        guard connected else { return }
        print("disconnect")
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?){
        connected = true
        subscribe()
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?){
        connected = false
        ping()
    }
}
