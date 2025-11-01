import Foundation

// 创建一些随机的命运结果
let fortunes = [
    "今天是你幸运的一天！",
    "你即将迎来一个意想不到的惊喜。",
    "注意你周围的人，可能会有意外发生。",
    "今天你最好保持低调。",
    "勇敢追求你的梦想吧，今天是个好机会！"
]

// 闭包生成一个命运
let getFortune = { (name: String, birthday: String) -> String in
    let randomIndex = Int.random(in: 0..<fortunes.count)
    return "\(name)，根据你的生日 \(birthday)，你的命运是：\(fortunes[randomIndex])"
}

// 输入姓名和生日
let name = "Alice"
let birthday = "1995-06-15"
let fortune = getFortune(name, birthday)
print(fortune)
