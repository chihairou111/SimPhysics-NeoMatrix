//
//  Appliances.swift
//  SimPhysics-Final
//
//  Created by Bruce Zheng on 3/24/25.
//

import SwiftUI

struct Appliances: View {
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(names, id: \.self) { name in
                        ZStack {
                            Text(name) // 或你要放的内容
                                .frame(width: 120, height: 120)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.gray.opacity(0.1))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
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
}

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

let names = ["hello", "yes", "no"]
