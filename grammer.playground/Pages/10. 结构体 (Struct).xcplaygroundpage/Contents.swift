//: [Previous](@previous)
/*:
 ## 10. 结构体 (Struct)
 
 结构体是用来封装相关数据和行为的类型。
 
 **结构体是值类型 (Value Type)**。这意味着当你传递一个结构体时，它会被复制。
 
 */

print("\n--- 10. 结构体 (Struct) ---")

// 声明结构体
struct Person {
    var name: String
    var age: Int
    
    func greet() -> String {
        return "Hello, my name is \(name) and I am \(age) years old."
    }
}

// 创建实例
let person = Person(name: "John", age: 30)
print(person.greet())

// --- 演示值类型 ---
print("--- 演示值类型 (Struct) ---")
var person2 = person // person 被复制给 person2
person2.name = "Jane" // 修改 person2

print("person 1 的名字: \(person.name)")   // 仍然是 "John"
print("person 2 的名字: \(person2.name)")  // 变成了 "Jane"

//: [Next](@next)
