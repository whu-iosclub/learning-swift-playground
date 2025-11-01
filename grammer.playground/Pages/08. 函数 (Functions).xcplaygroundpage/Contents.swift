//: [Previous](@previous)
/*:
 ## 8. 函数 (Functions)
 
 函数是用于执行特定任务的代码块。可以接收参数，并返回一个值。
 
 (注意：原文中的 `\\()` 是为了在 Markdown 中显示 `\()`，在 Swift 代码中我们直接使用 `\()`)
 
 */

print("\n--- 8. 函数 ---")

// 声明与调用函数 (带参数和返回值)
func greet(person: String) -> String {
    return "Hello, \(person)!" // 使用 \()
}

// 调用函数
let greeting_func = greet(person: "John")
print(greeting_func)


// 没有返回值的函数 (隐式返回 Void)
func sayHello() {
    print("Hello!")
}

sayHello()


// 多个参数的函数
func addNumbers(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

let sum = addNumbers(num1: 5, num2: 10)
print("5 + 10 = \(sum)")



//: [Next](@next)
