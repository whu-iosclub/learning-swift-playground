//: [Previous](@previous)
/*:
 ## 4. 数组 (Array)
 
 数组是一种有序的集合，可以存储相同类型的数据。
 
 ### 声明、访问与修改
 
 */

print("\n--- 4. 数组 (Array) ---")

// 声明数组
var numbers: [Int] = [1, 2, 3, 4, 5]
print("初始数组: \(numbers)")

// 访问与修改数组元素 (索引从 0 开始)
let firstNumber = numbers[0]
print("第一个元素: \(firstNumber)")

numbers[1] = 10  // 修改第二个元素 (从 2 改为 10)
print("修改后数组: \(numbers)")

// 数组常用方法
numbers.append(6)  // 在末尾添加新元素
print("append(6) 后: \(numbers)")

numbers.remove(at: 0)  // 删除第一个元素 (索引为 0 的元素)
print("remove(at: 0) 后: \(numbers)")

print("数组元素个数: \(numbers.count)")

//: [Next](@next)
