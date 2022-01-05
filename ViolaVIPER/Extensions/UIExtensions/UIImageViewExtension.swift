//
//  UIImageViewExtension.swift
//  ViolaVIPER
//
//  Created by George on 27.12.2021.
//

import Foundation

import UIKit
extension UIImage {
   internal static func placeholderImage() -> UIImage {
        return UIImage(named: "placeholderImage") ?? UIImage()
    }
}
