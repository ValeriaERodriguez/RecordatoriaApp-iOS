//
//  Reminder.swift
//  Recordatorio
//
//  Created by Mac on 24/07/2022.
//  Copyright © 2022 Valeria. All rights reserved.
//

import Foundation


struct Reminder {
    
    let text: String
    var completed: Bool
    
    mutating func toggleCompleted() {
        completed = !completed
    }
    
}
