//
//  Sidebar.swift
//  SimPhysics-Final
//
//  Created by Bruce Zheng on 3/24/25.
//

import SwiftUI

struct Sidebar: View {
    @State var isMenuSelected = false
    @State var isWireSelected = false
    @State var isAppliancesselected = false
    @State var isSettingsSelected = false
    @EnvironmentObject var items: Items
    var body: some View {
        HStack(spacing: 0) {
//Menu Button
            VStack(spacing:10) {
                Button(action: {
                    isMenuSelected.toggle()
                    if isMenuSelected {
                        disableOthers(for: "menu")
                    }
                }) {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 30, height: 20)
                        .foregroundStyle(isMenuSelected == true ? Color.blue : Color.black)
                        .padding()
                }
//Wire Button
                Button(action: {
                    isWireSelected.toggle()
                    if isWireSelected {
                        disableOthers(for: "wire")
                    }
                }) {
                    Image("Wire")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 20)
                        .foregroundStyle(isWireSelected == true ? Color.blue : Color.black)
                        .padding()
                }
//Appliances Button
                Button(action: {
                    isAppliancesselected.toggle()
                    if isAppliancesselected {
                        disableOthers(for: "appliances")
                    }
                }) {
                    Image(systemName: "cube")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(isAppliancesselected == true ? Color.blue : Color.black)
                        .padding()
                }
//Settings Button
                Button(action: {
                    isSettingsSelected.toggle()
                    if isSettingsSelected {
                        disableOthers(for: "settings")
                    }
                }) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(isSettingsSelected == true ? Color.blue : Color.black)
                        .padding()
                }

                Spacer()
            }
            .frame(width: 90)
            .background(Color.white) 
            .overlay(
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(Color.gray.opacity(0.3)),
                alignment: .trailing
            )

// IF-SELECTED LOGIC
            if isMenuSelected {
                
            }
            
            if isWireSelected {
                
            }
            
            if isAppliancesselected {
                Appliances()
                
            }
            
            if isSettingsSelected {
                
            }
            
            
            
        }
    }
    func disableOthers(for selected: String) {
        switch selected {
        case "menu":
            isWireSelected = false
            isAppliancesselected = false
            isSettingsSelected = false
        case "wire":
            isMenuSelected = false
            isAppliancesselected = false
            isSettingsSelected = false
        case "appliances":
            isMenuSelected = false
            isWireSelected = false
            isSettingsSelected = false
        case "settings":
            isWireSelected = false
            isAppliancesselected = false
            isMenuSelected = false
        default:
            break
        }
    }
}


#Preview {
    Sidebar()
        .environmentObject(Items())
}
