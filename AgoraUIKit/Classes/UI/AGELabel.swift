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

enum AGETextFontStyle {
    case font10, font11, font12, font13, font14,
         font15, font16, font17, font18, font19,
         font20
    
    var font: UIFont {
        switch self {
        case .font10: return .systemFont(ofSize: 10)
        case .font11: return .systemFont(ofSize: 11)
        case .font12: return .systemFont(ofSize: 12)
        case .font13: return .systemFont(ofSize: 13)
        case .font14: return .systemFont(ofSize: 14)
        case .font15: return .systemFont(ofSize: 15)
        case .font16: return .systemFont(ofSize: 16)
        case .font17: return .systemFont(ofSize: 17)
        case .font18: return .systemFont(ofSize: 18)
        case .font19: return .systemFont(ofSize: 19)
        case .font20: return .systemFont(ofSize: 20)
        }
    }
}

class AGELabel: UILabel {
    var colorStyle: AGETextColorStyle = .black {
        didSet {
            updateTextColor()
        }
    }
    var fontStyle: AGETextFontStyle = .font14 {
        didSet {
            updateTextFont()
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
    
    init(colorStyle: AGETextColorStyle = .black,
         fontStyle: AGETextFontStyle = .font14) {
        super.init(frame: .zero)
        self.colorStyle = colorStyle
        self.fontStyle = fontStyle
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateTextColor()
        updateTextFont()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        text = "label"
        textColor = .blueColor
        font = fontStyle.font
    }
    
    private func updateTextColor() {
        textColor = colorStyle.color
    }
    private func updateTextFont() {
        font = fontStyle.font
    }
}
