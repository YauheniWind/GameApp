//
//  UIViewController+Alert.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 23/04/2021.
//

import UIKit

extension UIViewController {
// Show a basic alert
    func showAlert(alertText: String, alertMessage: String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
// Add more actions as you see fit
    self.present(alert, animated: true, completion: nil)
    }

    func showAlertWithTwoButton(alertText: String, alertMessange: String) {
    let alert = UIAlertController(title: alertText, message: alertMessange, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
    alert.addAction(UIAlertAction(title: "Not got it", style: UIAlertAction.Style.destructive, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
}
