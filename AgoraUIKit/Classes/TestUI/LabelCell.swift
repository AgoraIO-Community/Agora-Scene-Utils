//
//  LabelCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/10.
//

import UIKit

class LabelCell: UITableViewCell {
    private lazy var label = AGELabel()
    private lazy var styleLabel: AGELabel = {
        let label = AGELabel(colorStyle: .warning, fontStyle: .large)
        label.text = "styleLabel"
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        styleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(styleLabel)
        
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        styleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        styleLabel.topAnchor.constraint(equalTo: label.topAnchor).isActive = true
    }
}
