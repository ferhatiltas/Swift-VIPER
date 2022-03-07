//
//  CustomLabel.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 8.03.2022.
//

import Foundation
import UIKit

class CustomLabel : UIViewController{

 func label() -> UILabel?  {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }
}
