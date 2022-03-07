//
//  StringExtensions.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 7.03.2022.
//

import Foundation

extension String {
    func getUrl()->URL?{
        return URL(string: self)
    }
}
