//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

// 创建计时器视图
struct TimerView: View {
    @State private var seconds = 0
    @State private var timerRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("\(seconds) 秒")
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: startTimer) {
                    Text("开始计时")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: stopTimer) {
                    Text("停止计时")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }

    // 开始计时
    func startTimer() {
            if !timerRunning {
                timerRunning = true
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    // 将状态更新放到主线程中
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
}

// 展示 SwiftUI 视图
PlaygroundPage.current.setLiveView(TimerView())

//: [Next](@next)
