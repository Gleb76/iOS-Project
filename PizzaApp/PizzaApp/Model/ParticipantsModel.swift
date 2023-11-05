//
//  ParticipantsModel.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import Foundation

import Foundation

struct Participant {
    let name: String
    let surname: String
    let telegramName: String
    let jobTitleName: String
    let photo: String
    
    static func getParticipants() -> [Participant] {
        return [
            Participant(name: "Глеб",
                        surname: "Клыга",
                        telegramName: "@glebklyga",
                        jobTitleName: "Team Lead",
                        photo: "Gleb"),
            Participant(name: "Глеб",
                        surname: "Зобнин",
                        telegramName: "@glebzo",
                        jobTitleName: "Programmer",
                        photo: "gleb_zobnin"),
            Participant(name: "Виктор",
                        surname: "Смирнов",
                        telegramName: "@vismirn95",
                        jobTitleName: "Programmer",
                        photo: "victor"),
            Participant(name: "Евгений",
                        surname: "Муравушкин",
                        telegramName: "@MURAVUSHKA420",
                        jobTitleName: "Programmer",
                        photo: "")
        ]
    }
}
