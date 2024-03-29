//
//  AGESlider.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/13.
//

import UIKit

open class AGESlider: UISlider {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        minimumTrackTintColor = .blueColor
        maximumTrackTintColor = .textOnAccent
        thumbTintColor = .blueColor
    }
}
