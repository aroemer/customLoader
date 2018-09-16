//
//  Service.swift
//  customLoader
//
//  Created by Audrey Roemer on 16/09/2018.
//  Copyright © 2018 Audrey Roemer. All rights reserved.
//

import UIKit

class ClosureService {
    
    static let shared = ClosureService()

    func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
        let obj = T()
        setup(obj)
        return obj
    }

}
