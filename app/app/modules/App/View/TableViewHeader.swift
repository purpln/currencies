//
//  TableViewHeader.swift
//  app
//
//  Created by Sergey Romanenko on 08.12.2020.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView{
    let amountLabel = appLabel(text: "", color: .label, alpha: 1)
    let priceLabel = appLabel(text: "", color: .label, alpha: 1)
    let totalLabel = appLabel(text: "", color: .label, alpha: 1)
    let stack = appStack()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(stack)
        contentView.backgroundColor = .systemBackground
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){
        stack.addArrangedSubviews(amountLabel, priceLabel, totalLabel)
        stack.anchors(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
