import SwiftUI

// 创建计时器视图 - 展示 @State 状态管理和定时器使用
struct TimerView: View {
    @State private var seconds = 0
    @State private var timerRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 30) {
            // 时间显示区域
            VStack {
                Text("计时器")
                    .font(.title2)
                    .foregroundColor(.secondary)

                Text(timeString)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .padding()
            }

            // 控制按钮
            HStack(spacing: 20) {
                Button(action: startTimer) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("开始")
                    }
                    .frame(width: 100)
                    .padding()
                    .background(timerRunning ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(timerRunning)

                Button(action: stopTimer) {
                    HStack {
                        Image(systemName: "pause.fill")
                        Text("暂停")
                    }
                    .frame(width: 100)
                    .padding()
                    .background(timerRunning ? Color.orange : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(!timerRunning)

                Button(action: resetTimer) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text("重置")
                    }
                    .frame(width: 100)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }

            // 说明文字
            VStack(alignment: .leading, spacing: 10) {
                Text("💡 学习要点：")
                    .font(.headline)
                Text("• 使用 @State 管理视图状态")
                Text("• Timer 的创建和管理")
                Text("• Button 的交互和样式")
                Text("• 条件渲染和禁用状态")
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("计时器示例")
        .navigationBarTitleDisplayMode(.inline)
    }

    // 格式化时间显示（分:秒）
    var timeString: String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }

    // 开始计时
    func startTimer() {
        if !timerRunning {
            timerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                DispatchQueue.main.async {
                    self.seconds += 1
                }
            }
        }
    }

    // 停止计时
    func stopTimer() {
        timer?.invalidate()
        timerRunning = false
    }

    // 重置计时器
    func resetTimer() {
        timer?.invalidate()
        timerRunning = false
        seconds = 0
    }
}
