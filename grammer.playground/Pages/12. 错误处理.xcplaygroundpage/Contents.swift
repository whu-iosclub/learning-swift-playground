//: [Previous](@previous)
/*:
 ## 12. 错误处理
 
 Swift 提供了内置的错误处理机制 (Error Handling)。
 
 1.  创建一个遵循 `Error` 协议的枚举（或结构体）。
 2.  创建一个可以 `throw`（抛出）错误的函数（标记为 `throws`）。
 3.  使用 `do-try-catch` 块来调用该函数并处理错误。
 
 */

print("\n--- 12. 错误处理 ---")

// 1. 声明错误类型
enum NetworkError: Error {
    case badURL
    case noInternet
    case requestFailed
}

// 2. 声明一个可能抛出错误的函数
func fetchData(from url: String) throws -> String {
    if url.isEmpty {
        throw NetworkError.badURL
    }
    if url == "no-internet.com" {
        throw NetworkError.noInternet
    }
    // 模拟成功
    return "Data from \(url)"
}

// 3. 捕获错误

// 示例 1: 捕获 badURL
print("--- 尝试空 URL ---")
do {
    let data = try fetchData(from: "")
    print("成功: \(data)")
} catch NetworkError.badURL {
    print("捕获错误: Bad URL")
} catch NetworkError.noInternet {
    print("捕获错误: No Internet")
} catch {
    print("捕获了其他错误: \(error)")
}

// 示例 2: 捕获 noInternet
print("\n--- 尝试 'no-internet.com' ---")
do {
    let data = try fetchData(from: "no-internet.com")
    print("成功: \(data)")
} catch NetworkError.badURL {
    print("捕获错误: Bad URL")
} catch NetworkError.noInternet {
    print("捕获错误: No Internet")
} catch {
    print("捕获了其他错误: \(error)")
}

// 示例 3: 成功
print("\n--- 尝试成功 ---")
do {
    let data = try fetchData(from: "apple.com")
    print("成功: \(data)")
} catch {
    print("捕获了意外的错误: \(error)")
}


//: [Next](@next)
