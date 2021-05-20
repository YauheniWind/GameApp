//
//  ReturnViewController.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 08/05/2021.
//

import UIKit

class ReturnViewController: UIViewController {
  
  @IBOutlet weak var recordLable: UILabel!
  var recordArray = [String]()
  var record = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if UserDefaults.standard.value(forKey: "userRecord") != nil {
      recordLable.text = UserDefaults.standard.value(forKey: "userRecord") as? String
    } else {
      return
    }
    record = recordLable.text ?? ""
    recordSave()
  }
  
  func recordSave() {
    let data = Date()
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(data).txt")
    let todos = String("Your score \(recordLable)")
    do {
      try todos.write(to: path, atomically: true, encoding: .utf8)
    } catch {
      print(error.localizedDescription)
    }
    var inString = ""
    do {
      inString = try String(contentsOf: path)
    } catch {
      print("Failed reading from URL: \(todos), Error: " + error.localizedDescription)
    }
    print("Read from the file: \(inString)")
    
    if UserDefaults.standard.value(forKey: "lastRecord") != nil {
      
      recordArray = UserDefaults.standard.value(forKey: "lastRecord") as? Array ?? []
      let lastRecord = record
      recordArray.append(lastRecord)
      UserDefaults.standard.setValue(recordArray, forKey: "lastRecord")
    }  else {
      recordArray.append(record)
      UserDefaults.standard.setValue(recordArray, forKey: "lastRecord")
      return
    }
  }
  
  @IBAction func returnButton(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let destinationViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
    destinationViewController.modalPresentationStyle = .fullScreen
    present(destinationViewController, animated: true, completion: nil)
  }
}
