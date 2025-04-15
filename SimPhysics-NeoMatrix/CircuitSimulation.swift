//
//  CircuitSimulation.swift
//  SimPhysics-Final
//
//  Created by Bruce Zheng on 3/27/25.
//

import SwiftUI

struct CircuitSimulation: View {
    @EnvironmentObject var items: Items
    
    // 控制缩放比例
    @State private var scale: CGFloat = 1.0
    // 存储偏移量
    @State private var offset = CGSize.zero
    // 临时拖动偏移量
    @GestureState private var dragOffset = CGSize.zero
    // 缩放限制
    let minScale: CGFloat = 0.5
    let maxScale: CGFloat = 5.0
    // 最大拖动距离
    let maxDragDistance: CGFloat = 230
    
    var body: some View {
        GeometryReader { geometry in
            // 底板直接作为主视图
            ZStack {
                // 背景色
                Color(white: 0.95)
                    .ignoresSafeArea()
                
                // 中心文字
                Text("电路模拟底板")
                    .font(.title)
                    .foregroundColor(.gray)
                    .scaleEffect(scale)
                    .offset(
                        x: limitDragOffset(offset.width + dragOffset.width, maxDistance: maxDragDistance), 
                        y: limitDragOffset(offset.height + dragOffset.height, maxDistance: maxDragDistance)
                    )
                
                // 重置按钮悬浮在右上角
                VStack {
                    HStack {
                        Spacer()
                        
                        Button("重置视图") {
                            withAnimation {
                                scale = 1.0
                                offset = .zero
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            // 将手势应用到整个视图
            .contentShape(Rectangle()) // 确保整个区域可交互
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        let newX = offset.width + value.translation.width
                        let newY = offset.height + value.translation.height
                        
                        self.offset.width = limitDragOffset(newX, maxDistance: maxDragDistance)
                        self.offset.height = limitDragOffset(newY, maxDistance: maxDragDistance)
                    }
            )
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        let delta = value - 1.0
                        scale = max(minScale, min(maxScale, scale + delta))
                    }
            )
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
    
    // 限制拖动距离，确保不超过最大值
    private func limitDragOffset(_ offset: CGFloat, maxDistance: CGFloat) -> CGFloat {
        return max(-maxDistance, min(maxDistance, offset))
    }
}

#Preview {
    ContentView()
        .environmentObject(Items())
}
