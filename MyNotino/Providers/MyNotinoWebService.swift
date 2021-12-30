//
//  MyNotinoWebService.swift
//  MyNotino
//
//  Created by Roman Podymov on 26/12/2021.
//  Copyright © 2021 MyNotino. All rights reserved.
//

import Foundation
import Moya

enum MyNotinoWebService {
    case products
}

extension MyNotinoWebService: TargetType {
    var baseURL: URL { URL(string: "https://my-json-server.typicode.com")! }

    var path: String {
        switch self {
        case .products:
            return "/cernfr1993/notino-assignment/db"
        }
    }

    var method: Moya.Method {
        switch self {
        case .products:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .products:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        nil
    }
}
