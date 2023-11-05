//
//  ParticipantsModel.swift
//  PizzaApp
//
//  Created by Глеб Клыга on 4.11.23.
//

import Foundation

struct Participant {
    let name: String
    let surname: String
    let telegramName: String
    
    static func getParticipants() -> [Participant] {
        [
            Participant(name: "Глеб",
                        surname: "Клыга",
                        telegramName: "@glebkly"),
            Participant(name: "Глеб",
                        surname: "Зобнин",
                        telegramName: "@glebzo"),
            Participant(name: "Виктор",
                        surname: "Смирнов",
                        telegramName: "@vismirn95"),
            Participant(name: "Евгений",
                        surname: "Муравушкин",
                        telegramName: "@MURAVUSHKA420")
        ]
    }
}
