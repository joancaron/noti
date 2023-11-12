//
//  ContentView.swift
//  Noti
//
//  Created by Joan Caron on 10.11.2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var currentSubview = AnyView(EmptyView())
    @State private var showingSubview = false

    private func showSubview(view: AnyView) {
        withAnimation(.easeOut(duration: 0.3)) {
            currentSubview = view
            showingSubview = true
        }
    }

    var body: some View {
        StackNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview) {
            VStack {
                NotificationsView()
                HStack {
                    Text("Noti 1.0.0")
                    Spacer()
                    Button(action: {
                        showSubview(view: AnyView(Text("Subview!")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)))
                    }, label: {
                        Image(systemName: "gear")
                        Text("Settings")
                    })
                    .buttonStyle(.borderless)
                }
                .padding(10)
                .frame(height: 40)
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 500, minHeight: 600)
        .background(.ultraThinMaterial)
        .modelContainer(for: Item.self, inMemory: true)
}
