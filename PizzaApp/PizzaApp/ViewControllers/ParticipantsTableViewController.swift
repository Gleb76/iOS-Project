//
//  ParticipantsTableViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit

final class ParticipantsTableViewController: UITableViewController {
    let participants = Participant.getParticipants()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let participant = participants[indexPath.row]
        
        performSegue(withIdentifier: "ShowPersonInfoSegue", sender: participant)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPersonInfoSegue",
           let participantVC = segue.destination as? ParticipantViewController,
           let participant = sender as? Participant {
            participantVC.participant = participant
        }
    }
}
