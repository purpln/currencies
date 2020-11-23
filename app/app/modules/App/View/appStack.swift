//
//  appStack.swift
//  app
//
//  Created by Sergey Romanenko on 23.11.2020.
//

import UIKit

class appStack:UIStackView{
    override init(frame:CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        isLayoutMarginsRelativeArrangement = true
        axis = .horizontal
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
