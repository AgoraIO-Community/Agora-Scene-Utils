//
//  TextFiledCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/14.
//

import UIKit

class TextFiledCell: UITableViewCell {
    private lazy var textFiled = AGETextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textFiled)
        textFiled.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        textFiled.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        textFiled.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        textFiled.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        textFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
