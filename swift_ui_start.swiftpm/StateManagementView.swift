import SwiftUI

// 状态管理示例 - 展示 @State 和 @Binding 的使用
struct StateManagementView: View {
    @State private var isToggleOn = false
    @State private var sliderValue: Double = 50
    @State private var selectedColor = Color.blue

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Toggle 示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("Toggle 开关")
                        .font(.headline)

                    Toggle("开关状态: \(isToggleOn ? "开启" : "关闭")", isOn: $isToggleOn)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)

                    if isToggleOn {
                        Text("开关已开启！")
                            .foregroundColor(.green)
                            .font(.title3)
                            .transition(.slide)
                    }

                    Text("📝 使用 @State 管理布尔值状态")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // Slider 示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("滑动条")
                        .font(.headline)

                    VStack {
                        Slider(value: $sliderValue, in: 0...100)
                        Text("当前值: \(Int(sliderValue))")
                            .font(.title2)
                            .fontWeight(.bold)

                        // 视觉反馈
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 20)
                            .frame(width: CGFloat(sliderValue) * 3)
                            .animation(.spring(), value: sliderValue)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                    Text("📝 Slider 绑定到 @State 变量")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 颜色选择器
                VStack(alignment: .leading, spacing: 10) {
                    Text("颜色选择")
                        .font(.headline)

                    HStack(spacing: 15) {
                        ColorButton(color: .blue, selectedColor: $selectedColor)
                        ColorButton(color: .red, selectedColor: $selectedColor)
                        ColorButton(color: .green, selectedColor: $selectedColor)
                        ColorButton(color: .purple, selectedColor: $selectedColor)
                        ColorButton(color: .orange, selectedColor: $selectedColor)
                    }

                    Rectangle()
                        .fill(selectedColor)
                        .frame(height: 100)
                        .cornerRadius(12)
                        .overlay(
                            Text("选中的颜色")
                                .foregroundColor(.white)
                                .font(.headline)
                        )

                    Text("📝 使用 @Binding 在子视图中修改父视图状态")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 学习要点
                VStack(alignment: .leading, spacing: 10) {
                    Text("💡 学习要点：")
                        .font(.headline)
                    Text("• @State: 在视图内部管理状态")
                    Text("• $变量名: 创建绑定（Binding）")
                    Text("• Toggle: 开关控件")
                    Text("• Slider: 滑动条控件")
                    Text("• @Binding: 在子视图中引用父视图状态")
                    Text("• 状态改变会自动刷新 UI")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("状态管理")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 颜色按钮组件 - 展示 @Binding 的使用
struct ColorButton: View {
    let color: Color
    @Binding var selectedColor: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 50, height: 50)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: selectedColor == color ? 4 : 0)
            )
            .shadow(radius: selectedColor == color ? 5 : 0)
            .onTapGesture {
                selectedColor = color
            }
    }
}

// 计数器示例 - 简单的状态管理演示
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 30) {
            Text("计数器")
                .font(.title2)
                .foregroundColor(.secondary)

            Text("\(count)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
                .foregroundColor(count > 0 ? .green : (count < 0 ? .red : .primary))
                .animation(.spring(), value: count)

            HStack(spacing: 20) {
                Button(action: { count -= 1 }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                }

                Button(action: { count = 0 }) {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.orange)
                }

                Button(action: { count += 1 }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                }
            }

            // 统计信息
            VStack(spacing: 8) {
                Text("操作统计")
                    .font(.headline)
                HStack {
                    VStack {
                        Text("\(count > 0 ? count : 0)")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("正数")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        Text("\(count < 0 ? -count : 0)")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("负数")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // 学习要点
            VStack(alignment: .leading, spacing: 10) {
                Text("💡 学习要点：")
                    .font(.headline)
                Text("• 使用 @State 管理计数状态")
                Text("• Button 的 action 闭包")
                Text("• SF Symbols 图标使用")
                Text("• 条件样式（三元运算符）")
                Text("• 动画效果 .animation()")
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("计数器示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}
