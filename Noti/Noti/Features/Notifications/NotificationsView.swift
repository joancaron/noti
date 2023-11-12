//
//  NotificationsView.swift
//  Noti
//
//  Created by Joan Caron on 11.11.2023.
//

import SwiftUI

struct NotificationsView: View {
    var notificationItems: [NotificationListItem] = []
    @State private var selection: NotificationListItem?

    init() {
        for index in 1 ... 50 {
            let service = index % 2 == 0 ? Services.github : Services.vercel
            let item = NotificationListItem(
                id: "id\(index)",
                title: "Notification \(index)",
                service: service,
                event: "Event \(index)",
                subject: "Subject \(index)",
                icon: Image(systemName: "bell"),
                seen: false,
                read: false
            )
            notificationItems.append(item)
        }
    }

    var body: some View {
        List(notificationItems, id: \.self, selection: $selection) { item in
            HStack {
                VStack {
                    Text(item.title)
                        .font(.headline)
                    Text("Service: \(item.service == .github ? "GitHub" : "Vercel")")
                }

                VStack {
                    Text("Event: \(item.event)")
                    Text("Subject: \(item.subject)")
                }
            }
            .listRowInsets(EdgeInsets())
            .padding(10)
            
        }
        .accentColor(.orange)
        .listStyle(.plain)
    }
}

#Preview {
    NotificationsView()
}
