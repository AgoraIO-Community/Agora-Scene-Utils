//
//  SliderCell.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/13.
//

import UIKit

class SliderCell: UITableViewCell {
    private lazy var sliderView: AGESlider = {
        let view = AGESlider()
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
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sliderView)
        
        sliderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        sliderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        sliderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        sliderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    }
}
