//
//  AnimationOptions.swift
//  AVanimations
//
//  Created by Artjoms Vorona on 20/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//
import UIKit

class AnimationOptions {
    
    static let shared = AnimationOptions()
    
    var animationOptions = [
        "curveEaseIn",
        "curveEaseOut",
        "curveLinear",
    ]

    var animationOptionsDict = [
        "curveEaseIn": UIView.AnimationOptions.curveEaseIn,
        "curveEaseOut": UIView.AnimationOptions.curveEaseOut,
        "curveLinear": UIView.AnimationOptions.curveLinear,
    ]
    
}
