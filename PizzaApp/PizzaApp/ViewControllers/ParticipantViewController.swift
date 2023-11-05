//
//  ParticipantViewController.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import UIKit

final class ParticipantViewController: UIViewController {
    
    var participant: Participant?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let participant = participant {
            nameLabel.text = "\(participant.name) \(participant.surname)"
            jobTitleLabel.text = participant.jobTitleName
            photoImageView.image = UIImage(named: participant.photo)
        }
        
        
    }
}
