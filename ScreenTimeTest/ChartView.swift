//
//  ContentView.swift
//  ScreenTimeTest
//
//  Created by Felipe Barusso on 20/10/23.
//

import SwiftUI
import DeviceActivity

struct ChartView: View {

    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
        segment: .daily(
            during: Calendar.current.dateInterval(
               of: .day, for: .now
            )!
        ),
        users: .all,
        devices: .init([.iPhone, .iPad])
    )

    var body: some View {
        ZStack {
            STProgressView()
            DeviceActivityReport(context, filter: filter)
        }
    }
}
