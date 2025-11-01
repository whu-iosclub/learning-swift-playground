import Foundation

// 生成一个随机数
let targetNumber = Int.random(in: 1...100)
var guess: Int? = nil
var attempts = 0

print("欢迎来到猜数字游戏！请输入 1 到 100 的数字。")

while guess != targetNumber {
    // 从控制台获取用户输入
    if let input = readLine(), let number = Int(input) {
        guess = number
        attempts += 1
        
        if guess! < targetNumber {
            print("太小了！再试一次。")
        } else if guess! > targetNumber {
            print("太大了！再试一次。")
        } else {
            print("恭喜！你猜对了！")
            print("你一共用了 \(attempts) 次机会。")
        }
    } else {
        print("无效输入，请输入一个有效的数字。")
    }
}
