//
//  Trolley.swift
//  TolleyApp
//
//  Created by Rashdan Natiq on 04/08/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import Foundation
import UIKit

class Trolley: NSObject {
    static let shared = Trolley()
    var items = [ItemInfo]()
    var price: Int? = 0
    override init() {
       
    }
   
   }
