//
//  GenericTVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class GenericTVC<T: UIView>: UITableViewCell {
    var wrappedView: T?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    private func setupCell() {
        let view = T.fromNib()
        view.frame = contentView.bounds
        contentView.addSubview(view)
        wrappedView = view
    }
}
