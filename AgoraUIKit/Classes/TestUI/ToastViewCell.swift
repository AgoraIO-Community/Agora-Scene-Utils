//
//  ToastViewCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/10.
//

import UIKit

class ToastViewCell: UITableViewCell {
    private lazy var topButton: AGEButton = {
        let button = AGEButton()
        button.setTitle("顶部位置", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(clickButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    private lazy var centerButton: AGEButton = {
        let button = AGEButton()
        button.setTitle("中间带图片位置", for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(clickButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    private lazy var bottomButton: AGEButton = {
        let button = AGEButton()
        button.setTitle("底部位置", for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(clickButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        topButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(topButton)
        contentView.addSubview(centerButton)
        contentView.addSubview(bottomButton)
                
        topButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        topButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        topButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10).isActive = true
        
        centerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        centerButton.topAnchor.constraint(equalTo: topButton.topAnchor).isActive = true
//        centerButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        centerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        bottomButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        bottomButton.topAnchor.constraint(equalTo: topButton.topAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc
    private func clickButtonHandler(sender: UIButton) {
        if sender.tag == 1 {
            AGEToastView.show(text: "顶部弹窗", postion: .top)
        } else if sender.tag == 2 {
            if #available(iOS 13.0, *) {
                AGEToastView.show(text: "中间带图片弹窗",
                                  tagImage: UIImage(systemName: "highlighter")?.withTintColor(.systemPink,
                                                                                              renderingMode: .alwaysOriginal),
                                  postion: .center)
            }
        } else {
            AGEToastView.show(text: "底部弹窗", postion: .bottom)
        }
    }
}
