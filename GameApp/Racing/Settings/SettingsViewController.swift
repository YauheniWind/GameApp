//
//  SettingsViewController.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 19/04/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func steampunkMan(_ sender: UIButton) {
        UserDefaults.standard.set("icSteampunk", forKey: "avatar")
    }
    @IBAction func monsterFromNightmare(_ sender: UIButton) {
        UserDefaults.standard.set("icMonster", forKey: "avatar")
    }
    @IBAction func justRunner(_ sender: UIButton) {
        UserDefaults.standard.set("icRunner", forKey: "avatar")
    }
}
