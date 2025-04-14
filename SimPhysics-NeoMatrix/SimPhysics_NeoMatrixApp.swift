//
//  SimPhysics_NeoMatrixApp.swift
//  SimPhysics-NeoMatrix
//
//  Created by Bruce Zheng on 4/7/25.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var image: String
}

class Items: ObservableObject {
    @Published var items: [Item] = [
        Item(name: "Ammeter", image: "A"),
        Item(name: "LED", image: "Light"),
        Item(name: "Resistance", image: "Resistance"),
        Item(name: "Switch", image: "Switch"),
        Item(name: "Voltmeter", image: "V")
    ]
}

@main
struct SimPhysics_NeoMatrixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
