//: [Previous](@previous)
/*:
 ##
 枚举（Enumeration）是一种定义一组相关值的类型。
 
 `switch` 语句是处理枚举值的最佳方式，Swift 的 `switch` 必须是穷尽的（Exhaustive），即必须覆盖所有情况。
 
 */

print("\n--- 9. 枚举 (Enum) ---")

// 声明枚举
enum Direction {
    case north
    case south
    case east
    case west
}

// 使用枚举
let currentDirection = Direction.north
print("当前方向: \(currentDirection)")

// 使用 Switch 语句匹配枚举值
print("--- Switch 语句 ---")
switch currentDirection {
case .north:
    print("Going north")
case .south:
    print("Going south")
case .east:
    print("Going east")
case .west:
    print("Going west")
    // default: // 如果覆盖了所有 case，则不需要 default
}

//: [Next](@next)
