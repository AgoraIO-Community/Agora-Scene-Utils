//
//  AGELabel.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/10.
//

import UIKit

enum AGETextColorStyle: Int, CaseIterable {
    case black
    case secondary
    case white
    case primary
    case error
    case warning
    case disabled

    var color: UIColor {
        switch self {
        case .black: return .black
        case .secondary: return .textOnAccent
        case .white: return .white
        case .primary: return .blueColor
        case .error: return .red
        case .warning: return .init(hex: "#F7AF32")
        case .disabled: return .textOnAccent
        }
    }
}

class AGELabel: UILabel {
    var colorStyle: AGETextColorStyle = .black {
        didSet {
            updateTextColor()
        }
    }
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    var maskedCorners: CACornerMask? {
        didSet {
            guard let corners = maskedCorners else { return }
            layer.maskedCorners = corners
        }
    }
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    var shadowPath: CGPath? {
        didSet {
            layer.shadowPath = shadowPath
        }
    }
    override var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    override var shadowOffset: CGSize {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    init(colorStyle: AGETextColorStyle = .black) {
        super.init(frame: .zero)
        self.colorStyle = colorStyle
        setupUI()
        updateTextColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateTextColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        text = "label"
        textColor = .blueColor
        font = .font14
    }
    
    private func updateTextColor() {
        textColor = colorStyle.color
    }
}
