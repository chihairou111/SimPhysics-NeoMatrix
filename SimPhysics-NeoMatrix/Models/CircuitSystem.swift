import Foundation

// 格点结构体，表示电路板上的一个点
struct GridPoint: Identifiable {
    let id = UUID()
    var position: (x: Int, y: Int)
    var componentIds: [UUID] // 存储该点上的元件ID
    var wireIds: [UUID] // 存储该点上的导线ID
}

// 电路元件结构体
struct CircuitComponent: Identifiable {
    let id = UUID()
    let type: ComponentType
    var endpoint1: (x: Int, y: Int) // 第一个端点位置
    var endpoint2: (x: Int, y: Int) // 第二个端点位置
    var properties: [String: Any] // 元件属性
}

// 导线结构体
struct Wire: Identifiable {
    let id = UUID()
    var endpoint1: (x: Int, y: Int) // 第一个端点位置
    var endpoint2: (x: Int, y: Int) // 第二个端点位置
    var current: Double? // 当前电流
}

// 电路系统主结构体
struct CircuitSystem {
    var grid: [[GridPoint]] // 二维网格地图
    var components: [CircuitComponent] // 所有电路元件
    var wires: [Wire] // 所有导线
    
    // 初始化网格
    init(width: Int, height: Int) {
        grid = Array(repeating: Array(repeating: GridPoint(position: (0, 0), componentIds: [], wireIds: []), count: height), count: width)
        for x in 0..<width {
            for y in 0..<height {
                grid[x][y].position = (x, y)
            }
        }
        components = []
        wires = []
    }
    
    // 添加元件
    mutating func addComponent(_ component: CircuitComponent) {
        components.append(component)
        grid[component.endpoint1.x][component.endpoint1.y].componentIds.append(component.id)
        grid[component.endpoint2.x][component.endpoint2.y].componentIds.append(component.id)
    }
    
    // 添加导线
    mutating func addWire(_ wire: Wire) {
        wires.append(wire)
        grid[wire.endpoint1.x][wire.endpoint1.y].wireIds.append(wire.id)
        grid[wire.endpoint2.x][wire.endpoint2.y].wireIds.append(wire.id)
    }
}