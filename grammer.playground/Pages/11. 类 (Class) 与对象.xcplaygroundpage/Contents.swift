//: [Previous](@previous)
/*:
 ## 11. 类 (Class) 与对象
 
 类（Class）与结构体类似，但**类是引用类型 (Reference Type)**。
 
 引用类型意味着当你传递一个类的实例时，传递的是对该实例的引用（或指针），而不是副本。
 
 类还支持**继承**。
 
 */

print("\n--- 11. 类 (Class) ---")

// 声明基类 (Base Class)
class Car {
    var brand: String
    var model: String
    
    // 构造函数
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
    
    func describe() -> String {
        return "This car is a \(brand) \(model)."
    }
}

let myCar = Car(brand: "Toyota", model: "Camry")
print(myCar.describe())

// 声明子类 (Subclass) - 继承
class ElectricCar: Car {
    var batteryLife: Int
    
    init(brand: String, model: String, batteryLife: Int) {
        self.batteryLife = batteryLife
        super.init(brand: brand, model: model) // 调用父类的构造函数
    }
    
    // 重写 (Override) 父类的方法
    override func describe() -> String {
        return "This is an \(brand) \(model) with a battery life of \(batteryLife) miles."
    }
}

let tesla = ElectricCar(brand: "Tesla", model: "Model X", batteryLife: 300)
print(tesla.describe())


// --- 演示引用类型 ---
print("--- 演示引用类型 (Class) ---")
let myOtherCar = myCar // myOtherCar 和 myCar 指向同一个对象
myOtherCar.model = "Corolla" // 修改 myOtherCar

print("myCar 的型号: \(myCar.model)")       // 变成了 "Corolla"
print("myOtherCar 的型号: \(myOtherCar.model)") // 也是 "Corolla"

//: [Next](@next)
