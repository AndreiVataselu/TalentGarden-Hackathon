//
//  MyProfileVC.swift
//  TalentGarden Hackathon
//
//  Created by Andrei Vătășelu on 23/11/2019.
//  Copyright © 2019 Andrei Vătășelu. All rights reserved.
//

import Foundation
import UIKit

class MyProfileVC: BaseVC {

    @IBOutlet private weak var statusCardView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        header?.configure(title: "My Profile")
    
        let layer = statusCardView.layer
        statusCardView.clipsToBounds = false
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 174/255, blue: 239/255, alpha: 0.5).cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    @IBAction private func inviteButtonPressed(_ sender: UIButton) {
        let activityControler = UIActivityViewController(activityItems: ["Join Bankify and earn 100 coins!"], applicationActivities: nil)
        present(activityControler, animated: true, completion: nil)
    }
}
