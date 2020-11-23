//
//  UIStackView.swift
//  app
//
//  Created by Sergey Romanenko on 19.11.2020.
//

import UIKit

extension UIStackView{
    func addArrangedSubviews(_ views: UIView...){
        for view in views{
            addArrangedSubview(view)
        }
    }
}
