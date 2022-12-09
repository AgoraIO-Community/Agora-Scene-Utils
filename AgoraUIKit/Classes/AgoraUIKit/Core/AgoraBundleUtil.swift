//
//  AgoraBundleUtil.swift
//  AgoraUIKit
//
//  Created by zhaoyongqiang on 2022/12/9.
//

import UIKit

class AgoraBundleUtil {
    class func loadBundle(bundleName: String?, podName: String?) -> Bundle? {
        var bundleName = bundleName ?? ""
        var podName = podName ?? ""
        if bundleName.isEmpty && podName.isEmpty {
            return nil
        } else if bundleName.isEmpty {
            bundleName = podName
        } else if podName.isEmpty {
            podName = bundleName
        }
        if bundleName.contains(".bundle") {
            bundleName = bundleName.components(separatedBy: ".bundle").first ?? ""
        }
        var associateBundleURL = Bundle.main.url(forResource: bundleName, withExtension: "bundle")
        if (associateBundleURL == nil) {
            associateBundleURL = Bundle.main.url(forResource: "Frameworks", withExtension: nil)
            associateBundleURL = associateBundleURL?.appendingPathComponent(podName)
            associateBundleURL = Bundle(url: associateBundleURL!)?
                .url(forResource: bundleName, withExtension: "bundle")
        }
        return (associateBundleURL != nil) ? Bundle(url: associateBundleURL ?? URL(fileURLWithPath: "")) : nil
    }
}
