//
//  AppConstants.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 8.03.2022.
//

import Foundation

final class ApplicationConstants {
    // REGEX CONSTANTS
    static let EMAIL_REGEX = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    static let PASSWORD_REGEX = "^.{4,8}$"
}
