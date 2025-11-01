import Foundation

// 创建水果价格表
let fruitPrices = [
    "苹果": 3.0,
    "香蕉": 2.5,
    "橙子": 4.0,
    "草莓": 5.0
]

// 创建购物车数组
var shoppingCart: [String] = []

// 添加水果到购物车
@MainActor func addFruitToCart(fruit: String) {
    if let _ = fruitPrices[fruit] {
        shoppingCart.append(fruit)
        print("\(fruit) 已添加到购物车。")
    } else {
        print("抱歉，没有这种水果。")
    }
}

// 计算总价
@MainActor func calculateTotal() -> Double {
    var total = 0.0
    for fruit in shoppingCart {
        if let price = fruitPrices[fruit] {
            total += price
        }
    }
    return total
}

// 测试购物车
addFruitToCart(fruit: "苹果")
addFruitToCart(fruit: "香蕉")
addFruitToCart(fruit: "橙子")

let total = calculateTotal()
print("你的购物车总价是：\(total) 元")
