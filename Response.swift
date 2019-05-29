//
//  Response.swift
//  MyService
//
//  Created by Rahul Chopra on 01/11/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import Foundation


class Response: NSObject {
    var success: Bool = false
    var dataObject: Dictionary<String, Any>?
    var serviceType: ServiceConstants.ServiceType?
}
