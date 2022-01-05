//
//  GoToBrowser.swift
//  ViolaVIPER
//
//  Created by George on 04.01.2022.
//


import Foundation
import UIKit

class LinkOperations {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)
                }
                else {
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}
