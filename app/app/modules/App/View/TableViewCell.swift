//
//  TableViewCell.swift
//  app
//
//  Created by Sergey Romanenko on 23.11.2020.
//

import UIKit

class TableViewCell:UITableViewCell{
    let amountLabel = appLabel(text: "", color: .label, alpha: 1)
    let priceLabel = appLabel(text: "", color: .label, alpha: 1)
    let totalLabel = appLabel(text: "", color: .label, alpha: 1)
    let stack = appStack()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(stack)
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
