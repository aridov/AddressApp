//
//  LocationError.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import Foundation

enum LocationError: Error {
    case LocationServicesDisabled
    case LocationUnknown
    case Denied
    case OtherCLError
    case OtherError
}
