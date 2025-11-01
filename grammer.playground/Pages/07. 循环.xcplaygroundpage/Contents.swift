//: [Previous](@previous)
/*:
 ## 7. 循环
 
 ### for-in 循环
 
 遍历一个序列（如数组、范围等）。
 
 ### while 循环
 
 在条件为真时重复执行。
 
 ### repeat-while 循环
 
 先执行一次，然后在条件为真时重复执行（类似 do-while）。
 
 */

print("\n--- 7. 循环 ---")

// for-in 循环 (遍历数组)
let loop_numbers = [1, 2, 3]
print("--- for-in 循环 ---")
for number in loop_numbers {
    print(number)
}

// for-in 循环 (遍历范围)
print("--- for-in 范围循环 ---")
for i in 1...3 { // 1...3 包括 1, 2, 3
    print("i = \(i)")
}


// while 循环
print("--- while 循环 ---")
var counter = 0
while counter < 3 {
    print(counter)
    counter += 1
}

// repeat-while 循环
print("--- repeat-while 循环 ---")
var count_repeat = 0
repeat {
    print(count_repeat)
    count_repeat += 1
} while count_repeat < 3

//: [Next](@next)
