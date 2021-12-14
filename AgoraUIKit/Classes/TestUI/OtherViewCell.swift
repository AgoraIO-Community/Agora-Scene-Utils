//
//  OtherViewCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/13.
//

import UIKit

class OtherViewCell: UITableViewCell {
    private lazy var liveAvatarButton: AGELiveAvatarButton = {
        let view = AGELiveAvatarButton(frame: .zero)
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        liveAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(liveAvatarButton)
        liveAvatarButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        liveAvatarButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        liveAvatarButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    }
}
