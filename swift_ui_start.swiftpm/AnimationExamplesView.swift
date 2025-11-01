import SwiftUI

// 动画示例 - 展示各种动画效果
struct AnimationExamplesView: View {
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var opacity: Double = 1.0

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // 基础动画
                VStack(spacing: 15) {
                    Text("基础动画")
                        .font(.headline)

                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .scaleEffect(isAnimating ? 1.5 : 1.0)
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isAnimating)

                    Button("开始/停止动画") {
                        isAnimating.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Text("📝 .animation() 修饰符添加动画")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 弹簧动画
                VStack(spacing: 15) {
                    Text("弹簧动画")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                        .frame(width: 100, height: 100)
                        .scaleEffect(scale)

                    Button("弹跳效果") {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.3)) {
                            scale = scale == 1.0 ? 1.5 : 1.0
                        }
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Text("📝 spring 动画有弹性效果")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 旋转动画
                VStack(spacing: 15) {
                    Text("旋转动画")
                        .font(.headline)

                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.purple)
                        .rotationEffect(.degrees(rotation))

                    Button("旋转 360°") {
                        withAnimation(.linear(duration: 1.0)) {
                            rotation += 360
                        }
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Text("📝 rotationEffect 实现旋转")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 淡入淡出
                VStack(spacing: 15) {
                    Text("淡入淡出")
                        .font(.headline)

                    Text("Hello SwiftUI!")
                        .font(.title)
                        .opacity(opacity)

                    Button("切换透明度") {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            opacity = opacity == 1.0 ? 0.2 : 1.0
                        }
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Text("📝 opacity 修饰符控制透明度")
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
                    Text("• .animation(): 隐式动画")
                    Text("• withAnimation(): 显式动画")
                    Text("• .spring(): 弹簧动画效果")
                    Text("• .easeInOut(): 缓动效果")
                    Text("• scaleEffect: 缩放")
                    Text("• rotationEffect: 旋转")
                    Text("• opacity: 透明度")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("动画示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 手势示例 - 展示各种手势识别
struct GestureExamplesView: View {
    @State private var offset = CGSize.zero
    @State private var currentScale: CGFloat = 1.0
    @State private var finalScale: CGFloat = 1.0
    @State private var rotationAngle: Double = 0
    @State private var tapCount = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // 点击手势
                VStack(spacing: 15) {
                    Text("点击手势")
                        .font(.headline)

                    Text("点击次数: \(tapCount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(30)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(15)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tapCount += 1
                            }
                        }

                    Button("重置") {
                        tapCount = 0
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                    Text("📝 onTapGesture 检测点击")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 拖动手势
                VStack(spacing: 15) {
                    Text("拖动手势")
                        .font(.headline)

                    Circle()
                        .fill(Color.green)
                        .frame(width: 80, height: 80)
                        .offset(offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offset = gesture.translation
                                }
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        offset = .zero
                                    }
                                }
                        )

                    Text("拖动圆形，松手后会回到中心")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text("📝 DragGesture 实现拖动")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .frame(height: 250)

                // 缩放手势
                VStack(spacing: 15) {
                    Text("缩放手势")
                        .font(.headline)

                    Image(systemName: "star.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.yellow)
                        .scaleEffect(finalScale * currentScale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    currentScale = value
                                }
                                .onEnded { _ in
                                    finalScale *= currentScale
                                    currentScale = 1.0
                                }
                        )

                    HStack {
                        Text("当前缩放: \(String(format: "%.2f", finalScale))")
                        Button("重置") {
                            withAnimation {
                                finalScale = 1.0
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                    .font(.caption)

                    Text("📝 用双指缩放星星（模拟器：按住 Option）")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // 旋转手势
                VStack(spacing: 15) {
                    Text("旋转手势")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(rotationAngle))
                        .gesture(
                            RotationGesture()
                                .onChanged { angle in
                                    rotationAngle = angle.degrees
                                }
                        )

                    Button("重置旋转") {
                        withAnimation {
                            rotationAngle = 0
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                    Text("📝 用双指旋转（模拟器：按住 Option + Shift）")
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
                    Text("• onTapGesture: 点击手势")
                    Text("• DragGesture: 拖动手势")
                    Text("• MagnificationGesture: 缩放手势")
                    Text("• RotationGesture: 旋转手势")
                    Text("• .gesture(): 添加手势识别")
                    Text("• onChanged/onEnded: 手势回调")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("手势示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}
