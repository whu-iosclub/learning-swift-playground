import SwiftUI

// Swift 基础语法示例
struct SwiftGrammarView: View {
    @State private var selectedExample = "变量和常量"

    let examples = [
        "变量和常量",
        "数据类型",
        "集合类型",
        "控制流",
        "函数",
        "可选类型"
    ]

    var body: some View {
        VStack {
            Picker("选择示例", selection: $selectedExample) {
                ForEach(examples, id: \.self) { example in
                    Text(example)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            ScrollView {
                exampleContent
                    .padding()
            }
        }
        .navigationTitle("Swift 语法")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    var exampleContent: some View {
        switch selectedExample {
        case "变量和常量":
            variablesAndConstants
        case "数据类型":
            dataTypes
        case "集合类型":
            collectionTypes
        case "控制流":
            controlFlow
        case "函数":
            functions
        case "可选类型":
            optionals
        default:
            Text("选择一个示例")
        }
    }

    var variablesAndConstants: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("变量和常量")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // 使用 let 声明常量
            let π = 3.14159
            let welcomeMessage = "Hello"

            // 使用 var 声明变量
            var score = 0
            score = 10  // 可以修改

            // 类型注解
            var name: String = "张三"
            var age: Int = 25
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• let 声明常量（不可变）")
            Text("• var 声明变量（可变）")
            Text("• Swift 有类型推断")
            Text("• 也可以显式指定类型")
        }
    }

    var dataTypes: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("基础数据类型")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // 整数
            let integer: Int = 42

            // 浮点数
            let pi: Double = 3.14159
            let height: Float = 1.75

            // 布尔值
            let isSwiftAwesome: Bool = true

            // 字符串
            let greeting: String = "你好"

            // 字符
            let char: Character = "A"
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• Int: 整数类型")
            Text("• Double/Float: 浮点数")
            Text("• Bool: 布尔值 (true/false)")
            Text("• String: 字符串")
            Text("• Character: 单个字符")
        }
    }

    var collectionTypes: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("集合类型")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // 数组 Array
            var fruits = ["苹果", "香蕉", "橙子"]
            fruits.append("葡萄")

            // 字典 Dictionary
            var scores = [
                "张三": 95,
                "李四": 88
            ]

            // 集合 Set
            var numbers: Set = [1, 2, 3, 4]
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• Array: 有序集合")
            Text("• Dictionary: 键值对集合")
            Text("• Set: 无序不重复集合")
            Text("• 使用 [] 访问元素")
        }
    }

    var controlFlow: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("控制流")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // if-else
            let score = 85
            if score >= 90 {
                print("优秀")
            } else if score >= 60 {
                print("及格")
            } else {
                print("不及格")
            }

            // for 循环
            for i in 1...5 {
                print(i)
            }

            // while 循环
            var count = 0
            while count < 3 {
                count += 1
            }
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• if-else: 条件判断")
            Text("• for-in: 遍历序列")
            Text("• while: 条件循环")
            Text("• 1...5: 闭区间 (包含5)")
            Text("• 1..<5: 半开区间 (不包含5)")
        }
    }

    var functions: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("函数")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // 基础函数
            func greet(name: String) -> String {
                return "你好, \\(name)!"
            }

            // 多参数函数
            func add(a: Int, b: Int) -> Int {
                return a + b
            }

            // 无返回值函数
            func printMessage(_ message: String) {
                print(message)
            }

            // 使用函数
            let greeting = greet(name: "小明")
            let sum = add(a: 5, b: 3)
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• func 声明函数")
            Text("• -> Type: 返回值类型")
            Text("• 参数有标签和名称")
            Text("• _ 省略参数标签")
        }
    }

    var optionals: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("可选类型")
                .font(.title2)
                .fontWeight(.bold)

            codeBlock("""
            // 可选类型声明
            var optionalName: String? = "张三"
            optionalName = nil  // 可以为 nil

            // 可选绑定 (if let)
            if let name = optionalName {
                print("姓名是 \\(name)")
            } else {
                print("没有姓名")
            }

            // 空合运算符
            let displayName = optionalName ?? "匿名"

            // 强制解包（慎用！）
            // let name = optionalName!
            """)

            Text("💡 要点：")
                .font(.headline)
            Text("• Type? 表示可选类型")
            Text("• 可选类型可以是值或 nil")
            Text("• if let: 安全解包")
            Text("• ??: 提供默认值")
            Text("• !: 强制解包（可能崩溃）")
        }
    }

    func codeBlock(_ code: String) -> some View {
        Text(code)
            .font(.system(.body, design: .monospaced))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}
