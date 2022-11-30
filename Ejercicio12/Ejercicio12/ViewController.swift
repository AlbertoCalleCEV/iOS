//
//  ViewController.swift
//  Ejercicio12
//
//  Created by Apps2M on 30/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var friendList: [Friends] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        friendList = [Friends(name: "Manolo", affinity: "2"), Friends(name: "Federico", affinity: "3"), Friends(name: "Eustaquio", affinity: "4"), Friends(name: "Juana", affinity: "1"), Friends(name: "Rosa Ana", affinity: "1"), Friends(name: "Manolita", affinity: "5"), Friends(name: "Francisco", affinity: "3"), Friends(name: "Adolfo", affinity: "2"), Friends(name: "Lucia", affinity: "5")]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        cell.nameLabel.text = friendList[indexPath.row].name
        cell.affinityLabel.text = String(friendList[indexPath.row].affinity)
        return cell
    }
    
    @IBAction func orderButton(_ sender: Any) {
        friendList = friendList.sorted(by: { (friend1, friend2) -> Bool in
            return friend1.affinity.compare(friend2.affinity) == ComparisonResult.orderedAscending
        })
        tableView.reloadData()
    }
    
}

