//
//  ButtonCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/10.
//

import UIKit

class ButtonCell: UITableViewCell {
    private lazy var textButton: AGEButton = {
        let button = AGEButton()
        button.setTitle("默认button", for: .normal)
        button.onClickButtonClosure = { sender in
            AGEToastView.show(text: sender.titleLabel?.text ?? "")
        }
        return button
    }()
    private lazy var leftButton: AGEButton = {
        let button = AGEButton(style: .outline(borderColor: .blueColor))
        button.setTitle("图片在左", for: .normal)
        button.setImage(UIImage(systemName: "keyboard")?.withTintColor(.red, renderingMode: .alwaysOriginal),
                        for: .normal,
                        postion: .left)
        button.onClickButtonClosure = { sender in
            AGEToastView.show(text: sender.titleLabel?.text ?? "")
        }
        return button
    }()
    private lazy var topButton: AGEButton = {
        let button = AGEButton(style: .outline(borderColor: .red))
        button.setTitle("图片在上", for: .normal)
        button.setImage(UIImage(systemName: "keyboard")?.withTintColor(.red, renderingMode: .alwaysOriginal),
                        for: .normal,
                        postion: .top)
        button.onClickButtonClosure = { sender in
            AGEToastView.show(text: sender.titleLabel?.text ?? "")
        }
        return button
    }()
    private lazy var rightButton: AGEButton = {
        let button = AGEButton(style: .outline(borderColor: .systemPink))
        button.setTitle("图片在右", for: .normal)
        button.setImage(UIImage(systemName: "keyboard")?.withTintColor(.red, renderingMode: .alwaysOriginal),
                        for: .normal,
                        postion: .right)
        button.onClickButtonClosure = { sender in
            AGEToastView.show(text: sender.titleLabel?.text ?? "")
        }
        return button
    }()
    private lazy var bottomButton: AGEButton = {
        let button = AGEButton(style: .outline(borderColor: .purple))
        button.setTitle("图片在下", for: .normal)
        button.setImage(UIImage(systemName: "keyboard")?.withTintColor(.red, renderingMode: .alwaysOriginal),
                        for: .normal,
                        postion: .bottom)
        button.onClickButtonClosure = { sender in
            AGEToastView.show(text: sender.titleLabel?.text ?? "")
        }
        return button
    }()
    
    private lazy var primaryFilled: AGEButton = {
        let button = AGEButton(style: .filled(backgroundColor: .blueColor))
        button.setTitle("filled", for: .normal)
        button.onClickButtonClosure = { _ in
            AGEToastView.show(text: "hehe")
        }
        return button
    }()
    
    private lazy var primaryOutline: AGEButton = {
        let button = AGEButton(style: .outline(borderColor: .blueColor))
        button.setTitle("outline", for: .normal)
        return button
    }()
    
    private lazy var startButton: AGEButton = {
        let button = AGEButton(style: .startLive)
        return button
    }()
    private lazy var createButton: AGEButton = {
        let button = AGEButton(style: .createLive)
        return button
    }()
    private lazy var settingButton: AGEButton = {
        let button = AGEButton(style: .setting)
        return button
    }()
    private lazy var switchButton: AGEButton = {
        let button = AGEButton(style: .switchCamera(imageColor: .blueColor))
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
        textButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textButton)
        contentView.addSubview(leftButton)
        contentView.addSubview(topButton)
        contentView.addSubview(rightButton)
        contentView.addSubview(bottomButton)
        
        textButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        textButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        leftButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        leftButton.topAnchor.constraint(equalTo: textButton.topAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        topButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        topButton.topAnchor.constraint(equalTo: textButton.topAnchor).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rightButton.leadingAnchor.constraint(equalTo: textButton.leadingAnchor).isActive = true
        rightButton.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: 20).isActive = true
//        rightButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bottomButton.trailingAnchor.constraint(equalTo: topButton.trailingAnchor).isActive = true
        bottomButton.topAnchor.constraint(equalTo: rightButton.topAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        primaryFilled.translatesAutoresizingMaskIntoConstraints = false
        primaryOutline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(primaryFilled)
        contentView.addSubview(primaryOutline)
        
        primaryFilled.leadingAnchor.constraint(equalTo: rightButton.leadingAnchor).isActive = true
        primaryFilled.topAnchor.constraint(equalTo: rightButton.bottomAnchor, constant: 20).isActive = true
        primaryFilled.widthAnchor.constraint(equalToConstant: 100).isActive = true
        primaryFilled.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        primaryOutline.topAnchor.constraint(equalTo: primaryFilled.topAnchor).isActive = true
        primaryOutline.trailingAnchor.constraint(equalTo: bottomButton.trailingAnchor).isActive = true
        primaryOutline.widthAnchor.constraint(equalToConstant: 100).isActive = true
        primaryOutline.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(startButton)
        contentView.addSubview(createButton)
        contentView.addSubview(settingButton)
        contentView.addSubview(switchButton)
        
        startButton.leadingAnchor.constraint(equalTo: primaryFilled.leadingAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: primaryFilled.bottomAnchor, constant: 15).isActive = true
        
        createButton.topAnchor.constraint(equalTo: startButton.topAnchor).isActive = true
        createButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        settingButton.topAnchor.constraint(equalTo: createButton.topAnchor).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: primaryOutline.trailingAnchor).isActive = true
        
        switchButton.leadingAnchor.constraint(equalTo: startButton.leadingAnchor).isActive = true
        switchButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 15).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}
