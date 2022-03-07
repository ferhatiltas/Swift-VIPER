//
//  NetworkPaths.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 8.03.2022.
//

import Foundation

enum NetworkPaths{
    case USERS
    case TODOS
    case PHOTOS
}
extension NetworkPaths {
    static let BASE_URL = "https://jsonplaceholder.typicode.com"
    var path : String  {
        switch self {
        case .USERS:
            return NetworkPaths.BASE_URL + "/users"
        case .TODOS:
            return NetworkPaths.BASE_URL + "/todos"
        case .PHOTOS:
            return NetworkPaths.BASE_URL + "/photos"
        }
    }
}
