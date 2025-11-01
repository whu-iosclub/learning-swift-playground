//: [Previous](@previous)
/*:
 ## 5. 字典 (Dictionary)
 
 字典是一个无序的键值对（Key-Value）集合，键必须是唯一的。
 
 ### 声明、访问与修改
 
 */

print("\n--- 5. 字典 (Dictionary) ---")

// 声明字典
var studentGrades: [String: Int] = ["John": 90, "Alice": 85, "Bob": 88]
print("初始字典: \(studentGrades)")

// 访问与修改字典元素
// 注意：通过键访问字典返回的是可选类型 (Optional)，因为键可能不存在
if let johnGrade = studentGrades["John"] {
    print("John's 成绩: \(johnGrade)")
} else {
    print("John 不存在")
}

studentGrades["Alice"] = 95  // 修改 Alice 的成绩
print("修改 Alice 成绩后: \(studentGrades)")

// 字典常用方法
studentGrades["Eve"] = 80  // 添加新键值对
print("添加 Eve 成绩后: \(studentGrades)")

studentGrades.removeValue(forKey: "Bob")  // 删除键为 "Bob" 的项
print("删除 Bob 成绩后: \(studentGrades)")

//: [Next](@next)
