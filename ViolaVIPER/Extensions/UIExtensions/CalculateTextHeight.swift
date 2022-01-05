//
//  CalculateTextHeight.swift
//  ViolaVIPER
//
//  Created by George on 03.01.2022.
//

import Foundation
import UIKit

extension UIFont {
  static  func calculateHeight(text: String, width: CGFloat,font:UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                        context: nil)
        return boundingBox.height
    }
}
