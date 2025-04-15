//
//  Appliances.swift
//  SimPhysics-Final
//
//  Created by Bruce Zheng on 3/24/25.
//

import SwiftUI

struct Appliances: View {
    @EnvironmentObject var items: Items
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(items.items) { item in
                        ZStack {
                            
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                            .frame(width: 120, height: 120)                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(items.selectedItem == item ? Color.blue.opacity(0.15) : Color.gray.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .onTapGesture {
                            if items.selectedItem == item {
                                items.selectedItem = nil
                            } else {
                                items.selectedItem = item
                            }
                            
                        }
                    }
                }
                .padding()
                .padding(.vertical)
            }
        }
        .frame(width: 300) // Sidebar width
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(width: 1)
                .foregroundColor(Color.gray.opacity(0.3)),
            alignment: .trailing
        )
    }
}

#Preview {
   ContentView()
        .environmentObject(Items())
}

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

let names = ["hello", "yes", "no"]
