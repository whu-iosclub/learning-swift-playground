import SwiftUI

// 颜色和渐变示例
struct ColorGradientView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // 基础颜色
                VStack(alignment: .leading, spacing: 10) {
                    Text("基础颜色")
                        .font(.headline)

                    HStack(spacing: 10) {
                        ColorBox(color: .red, name: "红色")
                        ColorBox(color: .blue, name: "蓝色")
                        ColorBox(color: .green, name: "绿色")
                    }

                    HStack(spacing: 10) {
                        ColorBox(color: .yellow, name: "黄色")
                        ColorBox(color: .purple, name: "紫色")
                        ColorBox(color: .orange, name: "橙色")
                    }

                    Text("📝 SwiftUI 内置颜色")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 透明度
                VStack(alignment: .leading, spacing: 10) {
                    Text("透明度")
                        .font(.headline)

                    HStack(spacing: 10) {
                        ForEach([1.0, 0.75, 0.5, 0.25], id: \.self) { opacity in
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue.opacity(opacity))
                                    .frame(height: 60)
                                Text("\(Int(opacity * 100))%")
                                    .font(.caption)
                            }
                        }
                    }

                    Text("📝 .opacity() 调整透明度")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 线性渐变
                VStack(alignment: .leading, spacing: 10) {
                    Text("线性渐变 (LinearGradient)")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 15)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 100)

                    RoundedRectangle(cornerRadius: 15)
                        .fill(
                            LinearGradient(
                                colors: [.blue, .cyan, .green],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 100)

                    Text("📝 LinearGradient 创建线性渐变")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 径向渐变
                VStack(alignment: .leading, spacing: 10) {
                    Text("径向渐变 (RadialGradient)")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 15)
                        .fill(
                            RadialGradient(
                                colors: [.yellow, .orange, .red],
                                center: .center,
                                startRadius: 20,
                                endRadius: 100
                            )
                        )
                        .frame(height: 150)

                    Text("📝 RadialGradient 创建径向渐变")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 角度渐变
                VStack(alignment: .leading, spacing: 10) {
                    Text("角度渐变 (AngularGradient)")
                        .font(.headline)

                    Circle()
                        .fill(
                            AngularGradient(
                                colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                                center: .center
                            )
                        )
                        .frame(height: 150)

                    Text("📝 AngularGradient 创建角度渐变（彩虹轮）")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 渐变叠加
                VStack(alignment: .leading, spacing: 10) {
                    Text("渐变叠加效果")
                        .font(.headline)

                    ZStack {
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )

                        VStack {
                            Image(systemName: "sparkles")
                                .font(.system(size: 60))
                            Text("漂亮的渐变")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                    }
                    .frame(height: 150)
                    .cornerRadius(15)

                    Text("📝 在渐变背景上叠加内容")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 自定义颜色
                VStack(alignment: .leading, spacing: 10) {
                    Text("自定义颜色 (RGB)")
                        .font(.headline)

                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1.0, green: 0.5, blue: 0.5))
                            .frame(height: 60)
                            .overlay(Text("RGB").foregroundColor(.white))

                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hue: 0.6, saturation: 0.8, brightness: 0.9))
                            .frame(height: 60)
                            .overlay(Text("HSB").foregroundColor(.white))

                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.7))
                            .frame(height: 60)
                            .overlay(Text("灰度").foregroundColor(.white))
                    }

                    Text("📝 使用 RGB, HSB 或灰度值创建自定义颜色")
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
                    Text("• Color: 基础颜色类型")
                    Text("• .opacity(): 设置透明度")
                    Text("• LinearGradient: 线性渐变")
                    Text("• RadialGradient: 径向渐变")
                    Text("• AngularGradient: 角度渐变")
                    Text("• 自定义 RGB/HSB 颜色")
                    Text("• 渐变可以作为填充或背景")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("颜色和渐变")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 颜色展示框组件
struct ColorBox: View {
    let color: Color
    let name: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 60)
            Text(name)
                .font(.caption)
        }
    }
}
