import Foundation

func rollDice(sides: Int, numberOfDice: Int) -> [Int] {
    return (1...numberOfDice).map { _ in Int.random(in: 1...sides) }
}

let numberOfDice = 3
let sides = 6

let rolls = rollDice(sides: sides, numberOfDice: numberOfDice)
print("你掷了 \(numberOfDice) 个 \(sides) 面的骰子，结果是：\(rolls)")
