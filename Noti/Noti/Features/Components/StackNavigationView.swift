//
//  StackNavigationView.swift
//  Noti
//
//  Created by Joan Caron on 10.11.2023.
//

import SwiftUI

// See https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4
struct StackNavigationView<RootContent>: View where RootContent: View {
    @Binding var currentSubview: AnyView
    @Binding var showingSubview: Bool
    let rootView: () -> RootContent

    init(
        currentSubview: Binding<AnyView>,
        showingSubview: Binding<Bool>,
        @ViewBuilder rootView: @escaping () -> RootContent
    ) {
        self._currentSubview = currentSubview
        self._showingSubview = showingSubview
        self.rootView = rootView
    }

    private struct StackNavigationSubview<Content>: View where Content: View {
        @Binding var isVisible: Bool
        let contentView: () -> Content

        var body: some View {
            VStack {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isVisible = false
                    }
                }, label: {
                    Label("back", systemImage: "chevron.left")
                })
                contentView() // subview
            }
        }
    }

    var body: some View {
        VStack {
            if !showingSubview {
                rootView().zIndex(-1)
            } else {
                StackNavigationSubview(isVisible: $showingSubview) {
                    currentSubview
            }
                .transition(AnyTransition.slide.animation(Animation.timingCurve(0.83, 0, 0.17, 1, duration: 0.150)))
            }
        }
    }
}
