//
//  NetworkError.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case WrongURL
    case WrongData
    case JSONError
}
