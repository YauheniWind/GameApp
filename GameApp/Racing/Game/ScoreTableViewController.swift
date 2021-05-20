//
//  TableViewController.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 08/05/2021.
//

import UIKit

class ScoreTableViewController: UIViewController {
    
    var recordTable = UserDefaults.standard.object(forKey: "lastRecord") as? [String] ?? [String]()

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
}

extension ScoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return recordTable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
      cell.textLabel?.text = recordTable[indexPath.row]
      cell.textLabel?.textColor = .black
        return cell
    }
    }
