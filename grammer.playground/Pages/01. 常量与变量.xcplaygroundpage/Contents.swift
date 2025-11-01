//: [Previous](@previous)

/*:
 ## 1. 常量与变量
 
 Swift 使用 `let` 声明常量（值不可变）和 `var` 声明变量（值可以改变）。
 
 ### 类型推断
 Swift 拥有强大的类型推断功能，可以根据初始值自动推断出类型。
 
 ### 类型注解
 
 如果需要，也可以使用 `: 类型` 的方式显式指定类型。
 
 */

print("--- 1. 常量与变量 ---")

// 变量 (var)
var name = "John"
print("变量 name 初始值: \(name)")
name = "Doe"
print("变量 name 修改后: \(name)")

// 常量 (let)
let pi = 3.14159
print("常量 pi: \(pi)")
// pi = 3.14 // 取消注释此行会报错，因为 pi 是常量

// 类型推断
let age = 25  // 自动推断 age 是 Int 类型
print("推断类型 (age): \(type(of: age))")

// 显式指定类型（类型注解）
let message: String = "Hello, Swift"
print("显式类型 (message): \(message)")

//: [Next](@next)
