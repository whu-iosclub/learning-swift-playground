import SwiftUI

// 主导航视图 - 展示所有 SwiftUI 教学示例
struct MainNavigationView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Swift 基础")) {
                    NavigationLink("Swift 语法入门", destination: SwiftGrammarView())
                }

                Section(header: Text("基础组件")) {
                    NavigationLink("Hello World 示例", destination: ContentView())
                    NavigationLink("布局示例 (VStack/HStack/ZStack)", destination: LayoutExamplesView())
                    NavigationLink("颜色和渐变", destination: ColorGradientView())
                }

                Section(header: Text("交互和状态")) {
                    NavigationLink("状态管理 (@State)", destination: StateManagementView())
                    NavigationLink("计数器示例", destination: CounterView())
                    NavigationLink("计时器", destination: TimerView())
                    NavigationLink("表单和输入", destination: FormExampleView())
                }

                Section(header: Text("列表和导航")) {
                    NavigationLink("列表示例", destination: ListExampleView())
                    NavigationLink("动态列表", destination: DynamicListView())
                }

                Section(header: Text("动画效果")) {
                    NavigationLink("基础动画", destination: AnimationExamplesView())
                    NavigationLink("手势和交互", destination: GestureExamplesView())
                }

                Section(header: Text("关于")) {
                    HStack {
                        Image(systemName: "swift")
                            .foregroundColor(.orange)
                        Text("SwiftUI 教学示例集")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("SwiftUI 教学示例")
        }
    }
}
