//
//  AGELiveAvatarButton.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/13.
//

import UIKit

open class AGELiveAvatarButton: UIButton {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let bundle = AgoraBundleUtil.loadBundle(bundleName: "AgoraUIKit",
                                                podName: "Agora-Scene-Utils")
        let path = bundle?.path(forResource: "avatar", ofType: "png") ?? ""
        imageView.image = UIImage(contentsOfFile: path)
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "person.circle")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "unkown"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setName(with avatar: UIImage?, name: String) {
        nameLabel.text = name
        avatarImageView.image = avatar
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hex: "#000000", alpha: 0.7)
        layer.cornerRadius = 21
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 42).isActive = true
        addSubview(avatarImageView)
        addSubview(nameLabel)
        
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}
