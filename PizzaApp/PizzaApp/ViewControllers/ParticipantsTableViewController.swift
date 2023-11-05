//
//  ParticipantsTableViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit

import UIKit

final class ParticipantsTableViewController: UITableViewController {
    let participants = Participant.getParticipants()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Assuming you want to display all participants in a single section
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let participant = participants[indexPath.row]
        cell.textLabel?.text = "\(participant.name) \(participant.surname)"
        cell.detailTextLabel?.text = participant.telegramName
        return cell
    }

    // Other table view delegate and data source methods can be implemented as needed
}
