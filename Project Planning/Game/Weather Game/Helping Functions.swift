//
//  Helping Functions.swift
//  Weather Game
//
//  Created by GWC on 7/17/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import Foundation
import UIKit

func randomCGFloat (_ lowerLimit: CGFloat, _ upperLimit: CGFloat) -> CGFloat {
    return lowerLimit + CGFloat(arc4random()) / CGFloat(UInt32.max) * (upperLimit - lowerLimit)
}
