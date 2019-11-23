//
//  AppDelegate.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().shadowImage = UIImage()
        let color = UIColor(red: 0, green: 135/255, blue: 1, alpha: 1)
        UINavigationBar.appearance().setBackgroundImage(color.imageFromColor(), for: .default)
        return true
    }
}

