//: [Previous](@previous)
/*:
 ## 6. 条件语句
 
 Swift 使用 `if`、`else if` 和 `else` 处理条件逻辑。
 
 ### 三元运算符
 
 也可以使用 `(条件) ? (真值) : (假值)` 的形式来简化。
 
 */

print("\n--- 6. 条件语句 ---")

let condition_age = 18

// if/else 语句
if condition_age > 18 {
    print("You are an adult.")
} else if condition_age == 18 {
    print("You are exactly 18.")
} else {
    print("You are a minor.")
}

// 三元运算符
let isAdult = (condition_age >= 18) ? "是成年人" : "是未成年人"
print("三元运算符结果: \(isAdult)")

//: [Next](@next)
