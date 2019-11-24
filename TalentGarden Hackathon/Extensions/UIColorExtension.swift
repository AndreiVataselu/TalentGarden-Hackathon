//
//  UIColorExtension.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
     func imageFromColor(size:CGSize = CGSize(width: 1, height: 1))->UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!

        context.setFillColor(self.cgColor)
        context.fill(rect)

        var image = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext()

        UIGraphicsBeginImageContext(size)
        image.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return image
    }
    
    static var seaweed: UIColor {
        return UIColor(red: 30/255, green: 214/255, blue: 108/255, alpha: 1)
    }
    
    static var ketchup: UIColor {
        return UIColor(red: 201/255, green: 29/255, blue: 0, alpha: 1)
    }
}
