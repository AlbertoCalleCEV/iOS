//
//  ViewController.swift
//  Agenda
//
//  Created by Apps2M on 12/1/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var events: [Event] = []
    let url = URL(string: "https://superapi.netlify.app/api/db/eventos")

    override func viewWillAppear(_ animated: Bool) {
        tableView.dataSource = self
        tableView.delegate = self
        
        URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if error == nil {
                do {
                    // Pasamos los datos de JSON a Objeto de Swift.
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    self.events.removeAll()
            
                    
                    for event in json as! [Any] {
                        if type(of: event) != NSNull.self {
                            
                            DispatchQueue.main.async {
                                [self] in
                                loading.isHidden = false
                                // Guardamos el json en el Array de eventos.
                                events.append(Event(json: event as! [String : Any]))
                                tableView.reloadData()
                                loading.isHidden = true
                            }
                        }
                    }
                } catch {
                    print("Error en data")
                }
            } else {
                print(error!)
            }
        }.resume()
    }
    
    // Creamos las funciones para el funcionamiento del TableView.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "eventID", for: indexPath) as! TableViewCell
        cell.nameLabel.text = events[indexPath.row].name
        cell.dateLabel.text = Event.createDateTime(timestamp: Double(events[indexPath.row].date))
        return cell
    }
}

