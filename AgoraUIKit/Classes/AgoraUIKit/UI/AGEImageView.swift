//
//  AGEImageView.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2021/12/13.
//

import UIKit

public enum AGEImageType: String {
    case avatar = "person.circle"
    case placeHolder = "pic-placeholding"
}

open class AGEImageView: UIImageView {
    public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    public var maskedCorners: CACornerMask? {
        didSet {
            guard let corners = maskedCorners else { return }
            layer.maskedCorners = corners
        }
    }
    
    private var imageType: AGEImageType = .placeHolder {
        didSet {
            updateImageType()
        }
    }
    
    public init(type: AGEImageType) {
        super.init(frame: .zero)
        self.imageType = type
    }
    
    @available(iOS 13.0, *)
    public init(systemName: String, imageColor: UIColor = .white) {
        super.init(frame: .zero)
        image = UIImage(systemName: systemName)?.withTintColor(imageColor,
                                                               renderingMode: .alwaysOriginal)
    }
    public init(imageName: String) {
        super.init(frame: .zero)
        image = UIImage(named: imageName)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentMode = .scaleAspectFit
        cornerRadius = 5
        isUserInteractionEnabled = true
    }
    
    private func updateImageType() {
        switch imageType {
        case .avatar:
            if #available(iOS 13.0, *) {
                image = UIImage(systemName: imageType.rawValue)?.withTintColor(.blueColor,
                                                                               renderingMode: .alwaysOriginal)
            } else {
                let bundle = AgoraBundleUtil.loadBundle(bundleName: "AgoraUIKit",
                                                        podName: "Agora-Scene-Utils")
                let path = bundle?.path(forResource: "avatar", ofType: "png") ?? ""
                image = UIImage(contentsOfFile: path)
            }
            
        default:
            image = UIImage(named: imageType.rawValue)
        }
    }
}
