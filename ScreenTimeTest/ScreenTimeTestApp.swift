//
//  ScreenTimeTestApp.swift
//  ScreenTimeTest
//
//  Created by Felipe Barusso on 20/10/23.
//

import SwiftUI
import DeviceActivity
import FamilyControls

@main
struct Screen_TimeApp: App {
    let center = AuthorizationCenter.shared
    @State var show = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if show {
                    ChartView()
                } else {
                    STProgressView()
                }
            }.onAppear {
                Task {
                    do {
                        try await center.requestAuthorization(for: FamilyControlsMember.individual)
                        show = true
                    } catch {
                        print("Error on requesting authorization: \(error)")
                    }
                }
            }
        }
    }
}

struct STProgressView: View {
    var body: some View {
        ProgressView {
            Text("Loading")
        }
    }
}
