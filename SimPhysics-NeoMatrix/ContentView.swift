//
//  ContentView.swift
//  SimPhysics-Final
//
//  Created by Bruce Zheng on 3/24/25.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        ZStack {
            HStack {
                Sidebar()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
           
           
        }
    }
}

#Preview {
    ContentView()
}
