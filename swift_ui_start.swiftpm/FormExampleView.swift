import SwiftUI

// 表单示例 - 展示各种用户输入控件
struct FormExampleView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var age = 18.0
    @State private var agreeToTerms = false
    @State private var selectedColor = "蓝色"
    @State private var selectedDate = Date()
    @State private var bio = ""
    @State private var showingAlert = false

    let colors = ["红色", "蓝色", "绿色", "黄色", "紫色"]

    var body: some View {
        Form {
            Section(header: Text("个人信息")) {
                TextField("姓名", text: $name)
                TextField("电子邮件", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }

            Section(header: Text("详细信息")) {
                VStack(alignment: .leading) {
                    Text("年龄: \(Int(age))")
                    Slider(value: $age, in: 1...100, step: 1)
                }

                Picker("喜欢的颜色", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color)
                    }
                }

                DatePicker("生日", selection: $selectedDate, displayedComponents: .date)
            }

            Section(header: Text("简介")) {
                TextEditor(text: $bio)
                    .frame(height: 100)

                Text("\(bio.count) 个字符")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Section {
                Toggle("同意条款和条件", isOn: $agreeToTerms)
            }

            Section {
                Button(action: submitForm) {
                    HStack {
                        Spacer()
                        Text("提交")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .disabled(!isFormValid)
            }

            Section(header: Text("💡 学习要点")) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Form: 创建表单界面")
                    Text("• TextField: 单行文本输入")
                    Text("• TextEditor: 多行文本输入")
                    Text("• Slider: 滑动选择数值")
                    Text("• Picker: 选择器")
                    Text("• DatePicker: 日期选择")
                    Text("• Toggle: 开关")
                    Text("• Section: 分组表单元素")
                }
                .font(.caption)
            }
        }
        .navigationTitle("表单示例")
        .navigationBarTitleDisplayMode(.inline)
        .alert("表单已提交", isPresented: $showingAlert) {
            Button("确定", role: .cancel) { }
        } message: {
            Text("姓名: \(name)\n年龄: \(Int(age))\n颜色: \(selectedColor)")
        }
    }

    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && agreeToTerms
    }

    func submitForm() {
        showingAlert = true
    }
}
