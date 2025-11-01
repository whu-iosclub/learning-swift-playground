import SwiftUI

// 基础 Hello World 示例 - 最简单的 SwiftUI 视图
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 系统图标
            Image(systemName: "swift")
                .imageScale(.large)
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            // 标题文字
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)

            // 副标题
            Text("欢迎来到 SwiftUI 世界")
                .font(.title3)
                .foregroundColor(.secondary)

            // 说明文字
            VStack(alignment: .leading, spacing: 10) {
                Text("💡 这是最基础的 SwiftUI 视图：")
                    .font(.headline)
                    .padding(.top)

                Text("• VStack: 垂直排列视图")
                Text("• Image: 显示图片或图标")
                Text("• Text: 显示文本")
                Text("• 修饰符: .font(), .foregroundColor() 等")
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)

            Spacer()

            // 提示文字
            Text("👈 点击左上角菜单查看更多示例")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Hello World")
        .navigationBarTitleDisplayMode(.inline)
    }
}
