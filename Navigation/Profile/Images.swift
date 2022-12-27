//
//  Images.swift
//  Navigation
//
//  Created by Мария on 26.12.2022.
//

import Foundation
import UIKit


public class ImageProvider {
    static func getImages() -> [UIImage] {
        [UIImage(named: "berries"),
         UIImage(named: "flowers"),
         UIImage(named: "home"),
         UIImage(named: "stones"),
         UIImage(named: "sunset"),
         UIImage(named: "balloons"),
         UIImage(named: "river"),
         UIImage(named: "temple"),
         UIImage(named: "airplane"),
         UIImage(named: "theater"),
         UIImage(named: "sunset homes"),
         UIImage(named: "mosque"),
         UIImage(named: "mushrooms"),
         UIImage(named: "town"),
         UIImage(named: "cone"),
         UIImage(named: "boletus"),
         UIImage(named: "maple leaf"),
         UIImage(named: "chocolate bomb"),
         UIImage(named: "chocolate coconut"),
         UIImage(named: "watch")
        ].compactMap { paramImage in
            return paramImage
        }
    }
}
// функция compactMap вместо forceunwrap
