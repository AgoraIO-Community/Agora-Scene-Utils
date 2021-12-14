//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit

extension UIFont {
    static var font10: UIFont {
        .systemFont(ofSize: 10)
    }
    static var font11: UIFont {
        .systemFont(ofSize: 11)
    }
    static var font12: UIFont {
        .systemFont(ofSize: 12)
    }
    static var font13: UIFont {
        .systemFont(ofSize: 13)
    }
    static var font14: UIFont {
        .systemFont(ofSize: 14)
    }
    static var font15: UIFont {
        .systemFont(ofSize: 15)
    }
    static var font16: UIFont {
        .systemFont(ofSize: 16)
    }
    static var font17: UIFont {
        .systemFont(ofSize: 17)
    }
    static var font18: UIFont {
        .systemFont(ofSize: 18)
    }
    static var font19: UIFont {
        .systemFont(ofSize: 19)
    }
    static var font20: UIFont {
        .systemFont(ofSize: 20)
    }
}
extension UIFont {
    func bold() -> UIFont {
        .systemFont(ofSize: pointSize, weight: .bold)
    }

    func semibold() -> UIFont {
        .systemFont(ofSize: pointSize, weight: .semibold)
    }

    func medium() -> UIFont {
        .systemFont(ofSize: pointSize, weight: .medium)
    }
}
