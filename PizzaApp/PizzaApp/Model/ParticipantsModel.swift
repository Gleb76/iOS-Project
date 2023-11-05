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
<<<<<<< HEAD
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
=======
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
>>>>>>> 42b3e5ebbb1b27b8a53f99ab506c54a673ecf664
                        surname: "Муравушкин",
                        telegramName: "@MURAVUSHKA420")
        ]
    }
}
