//
//  ViewController.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 18/03/2021.
//

import UIKit

class ViewController: UIViewController {
    private let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

@IBAction private func goToGame(_ sender: Any) {
    let storyboard = UIStoryboard(name: "GameViewController", bundle: Bundle.main)
    let destinationViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController")
    destinationViewController.modalPresentationStyle = .fullScreen
    present(destinationViewController, animated: true, completion: nil)
    dateFormatter.dateFormat = "dd.MM.YYYY HH:mm"
    let dateString = dateFormatter.string(from: Date())
    print("Start of the game at \(dateString)")
    }
}
