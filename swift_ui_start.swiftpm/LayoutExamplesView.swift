import SwiftUI

// 布局示例 - 展示 VStack, HStack, ZStack 的使用
struct LayoutExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // VStack 示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("VStack - 垂直布局")
                        .font(.headline)

                    VStack(spacing: 10) {
                        ForEach(1...3, id: \.self) { index in
                            Text("项目 \(index)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(8)
                        }
                    }

                    Text("📝 VStack 将视图垂直排列")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // HStack 示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("HStack - 水平布局")
                        .font(.headline)

                    HStack(spacing: 10) {
                        ForEach(1...3, id: \.self) { index in
                            Text("项目 \(index)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green.opacity(0.3))
                                .cornerRadius(8)
                        }
                    }

                    Text("📝 HStack 将视图水平排列")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // ZStack 示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("ZStack - 层叠布局")
                        .font(.headline)

                    ZStack {
                        Rectangle()
                            .fill(Color.purple.opacity(0.3))
                            .frame(width: 200, height: 200)

                        Circle()
                            .fill(Color.orange.opacity(0.5))
                            .frame(width: 150, height: 150)

                        Text("叠加文字")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Text("📝 ZStack 将视图层叠排列")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 组合布局示例
                VStack(alignment: .leading, spacing: 10) {
                    Text("组合布局")
                        .font(.headline)

                    HStack {
                        VStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.largeTitle)
                            Text("VStack")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(8)

                        VStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                            Text("在 HStack 中")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(8)
                    }

                    Text("📝 可以嵌套使用不同的布局容器")
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
                    Text("• VStack: 垂直方向排列视图")
                    Text("• HStack: 水平方向排列视图")
                    Text("• ZStack: 深度方向层叠视图")
                    Text("• spacing: 控制视图间距")
                    Text("• alignment: 控制对齐方式")
                    Text("• 可以嵌套使用创建复杂布局")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("布局示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}
