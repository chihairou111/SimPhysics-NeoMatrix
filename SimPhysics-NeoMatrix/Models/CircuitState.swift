import Foundation

//电路元件的结构体，表示电路中的一个元件
struct CircuitComponent: Identifiable {
    let id = UUID()
    let type: ComponentType
    var position: (x: Int, y: Int)
    var properties: [String: Any]
}

//电路元件类型的枚举，每一个类型都写到这里哦
enum ComponentType: String, CaseIterable {
    case resistor
    case capacitor
    case inductor
    case voltageSource
    case currentSource
    case wire
    case ground
}

//电路状态的结构体，包含了电路的大小、元件和连接关系====存储整个电路表
struct CircuitState {
    var gridSize: (width: Int, height: Int)
    var components: [CircuitComponent]
    var connections: [Connection]
    
    struct Connection {
        let from: UUID
        let to: UUID
    }
    
    func component(at position: (x: Int, y: Int)) -> CircuitComponent? {
        // 首先查找当前位置的元件
        if let mainComponent = components.first(where: { $0.position == position }) {
            return mainComponent
        }
        
        // 如果没有找到，检查是否有连接线经过这个位置
        for connection in connections {
            if let fromComponent = components.first(where: { $0.id == connection.from }),
               let toComponent = components.first(where: { $0.id == connection.to }) {
                // 检查是否在连接线上
                if isPositionOnConnectionLine(position: position, from: fromComponent.position, to: toComponent.position) {
                    // 返回一个虚拟的wire元件
                    return CircuitComponent(type: .wire, position: position, properties: [:])
                }
            }
        }11q/
        return nil
    }
    
    private func isPositionOnConnectionLine(position: (x: Int, y: Int), from: (x: Int, y: Int), to: (x: Int, y: Int)) -> Bool {
        // 简单实现：检查位置是否在连接线的矩形区域内
        let minX = min(from.x, to.x)
        let maxX = max(from.x, to.x)
        let minY = min(from.y, to.y)
        let maxY = max(from.y, to.y)
        
        return position.x >= minX && position.x <= maxX &&
               position.y >= minY && position.y <= maxY
    }
}