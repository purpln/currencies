//
//  ViewControllerHelper.swift
//  app
//
//  Created by Sergey Romanenko on 23.11.2020.
//

import UIKit

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func configure(){
        configureButtons()
        configureTableView()
        view.addSubviews(btcusdt, bnbbtc, ethbtc, tableView)
        view.backgroundColor = .systemBackground
        
        btcusdt.anchors(top: view.safeTopAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        bnbbtc.anchors(top: btcusdt.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        ethbtc.anchors(top: bnbbtc.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        tableView.anchors(top: ethbtc.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func configureButtons(){
        btcusdt.setTitle(Currencies.btcusdt.rawValue, for: .normal)
        bnbbtc.setTitle(Currencies.bnbbtc.rawValue, for: .normal)
        ethbtc.setTitle(Currencies.ethbtc.rawValue, for: .normal)
        btcusdt.setTitleColor(.label, for: .normal)
        bnbbtc.setTitleColor(.label, for: .normal)
        ethbtc.setTitleColor(.label, for: .normal)
        btcusdt.tag = 1
        bnbbtc.tag = 2
        ethbtc.tag = 3
        btcusdt.addTarget(self, action: #selector(selection), for: .touchUpInside)
        bnbbtc.addTarget(self, action: #selector(selection), for: .touchUpInside)
        ethbtc.addTarget(self, action: #selector(selection), for: .touchUpInside)
    }
    
    func configureTableView(){
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(TableViewCell.self, forCellReuseIdentifier: constants.bidCell)
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! TableViewHeader
        view.amountLabel.text = "Amount BTC"
        view.priceLabel.text = "Price USD"
        view.totalLabel.text = "Total"
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case self.tableView:
            switch type{
            case .bid: return response?.b.count ?? 0
            case .ask: return response?.a.count ?? 0
            default: return 0
            }
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.bidCell, for: indexPath) as! TableViewCell
        if indexPath.row % 2 == 0 {
            cell.stack.backgroundColor = .systemGray6
        }
        switch type{
        case .bid:
            cell.priceLabel.text = format2(response?.b[indexPath.row][0])
            cell.amountLabel.text = format5(response?.b[indexPath.row][1])
            cell.totalLabel.text = total(response?.b[indexPath.row][0], response?.b[indexPath.row][1])
            cell.priceLabel.textColor = .systemGreen
        case .ask:
            cell.priceLabel.text = format2(response?.a[indexPath.row][0])
            cell.amountLabel.text = format5(response?.a[indexPath.row][1])
            cell.totalLabel.text = total(response?.a[indexPath.row][0], response?.a[indexPath.row][1])
            cell.priceLabel.textColor = .systemRed
        default: return UITableViewCell()
        }
        return cell
    }
    
    private func format2(_ string:String?) -> String{
        return String(format: "%.2f", (Double(string ?? "0") ?? 0))
    }
    
    private func format5(_ string:String?) -> String{
        return String(format: "%.5f", (Double(string ?? "0") ?? 0))
    }
    
    private func total(_ first:String?, _ second:String?) -> String{
        return String(format: "%.5f", (Double(first ?? "0") ?? 0)*(Double(second ?? "0") ?? 0))
    }
}
