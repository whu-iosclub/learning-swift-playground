import Foundation

func calculate(_ num1: Double, _ num2: Double, using operation: (Double, Double) -> Double) -> Double {
    return operation(num1, num2)
}

// 定义各种运算闭包
let add: (Double, Double) -> Double = { $0 + $1 }
let subtract: (Double, Double) -> Double = { $0 - $1 }
let multiply: (Double, Double) -> Double = { $0 * $1 }
let divide: (Double, Double) -> Double = { $0 / $1 }

// 测试计算器
let result = calculate(10, 5, using: add)
print("结果是：\(result)")

