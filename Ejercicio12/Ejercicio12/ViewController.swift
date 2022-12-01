//
//  ViewController.swift
//  Ejercicio12
//
//  Created by Apps2M on 30/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        DataManager.loadFriends()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        cell.nameLabel.text = DataManager.friends[indexPath.row].name
        cell.affinityLabel.text = String(DataManager.friends[indexPath.row].affinity)
        return cell
    }
    
    @IBAction func orderButton(_ sender: Any) {
        DataManager.friends = DataManager.friends.sorted(by: { (friend1, friend2) -> Bool in
            return friend1.affinity.compare(friend2.affinity) == ComparisonResult.orderedAscending
        })
        tableView.reloadData()
    }
    
}

