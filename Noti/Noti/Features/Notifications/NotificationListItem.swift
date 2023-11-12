//
//  NotificationListItem.swift
//  Noti
//
//  Created by Joan Caron on 12.11.2023.
//

import Foundation
import SwiftUI

enum Services {
    case github
    case vercel
}

struct NotificationListItem: Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    init(id: String, title: String, service: Services, event: String, subject: String, icon: Image, seen: Bool, read: Bool) {
        self.id = id
        self.title = title
        self.service = service
        self.event = event
        self.subject = subject
        self.icon = icon
        self.seen = seen
        self.read = read
    }

    var id: String
    var title: String
    var service: Services
    var event: String
    var subject: String
    var icon: Image
    var seen: Bool
    var read: Bool
}
