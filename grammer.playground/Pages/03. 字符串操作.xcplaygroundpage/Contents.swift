//: [Previous](@previous)
/*:
 ## 3. 字符串操作
 
 ### 字符串拼接
 
 可以使用 `+` 运算符进行字符串拼接。
 
 ### 字符串插值
 
 可以在字符串中使用 `\()` 语法插入变量或表达式，这是 Swift 中更推荐的方式。
 
 (注意：原文中的 `\\()` 是为了在 Markdown 中显示 `\()`，在 Swift 代码中我们直接使用 `\()`)
 
 */

print("\n--- 3. 字符串操作 ---")

// 字符串拼接
let firstName = "John"
let lastName = "Doe"
let fullName = firstName + " " + lastName
print("拼接: \(fullName)")

// 字符串插值
let intro_name = "Jane"
let intro_age = 25
let introduction = "My name is \(intro_name) and I am \(intro_age) years old."
print("插值: \(introduction)")

// 表达式插值
print("五年后，\(intro_name) 将是 \(intro_age + 5) 岁。")

//: [Next](@next)
