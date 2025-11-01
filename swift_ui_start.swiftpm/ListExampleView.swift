import SwiftUI

// 列表示例 - 展示 List 的基本使用
struct ListExampleView: View {
    let fruits = ["苹果", "香蕉", "橙子", "葡萄", "草莓", "西瓜", "芒果", "樱桃"]
    let vegetables = ["胡萝卜", "西红柿", "黄瓜", "茄子", "白菜"]

    var body: some View {
        List {
            Section(header: Text("水果")) {
                ForEach(fruits, id: \.self) { fruit in
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                        Text(fruit)
                    }
                }
            }

            Section(header: Text("蔬菜")) {
                ForEach(vegetables, id: \.self) { vegetable in
                    HStack {
                        Image(systemName: "carrot.fill")
                            .foregroundColor(.orange)
                        Text(vegetable)
                    }
                }
            }

            Section(header: Text("💡 学习要点")) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("• List: 创建滚动列表")
                    Text("• Section: 分组显示")
                    Text("• ForEach: 遍历数据")
                    Text("• id: \\.self: 使用字符串本身作为标识")
                }
                .font(.caption)
            }
        }
        .navigationTitle("列表示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 动态列表示例 - 展示增删改查功能
struct DynamicListView: View {
    @State private var items: [TodoItem] = [
        TodoItem(title: "学习 SwiftUI"),
        TodoItem(title: "练习编程"),
        TodoItem(title: "阅读文档")
    ]
    @State private var newItemTitle = ""
    @State private var showingAddSheet = false

    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .gray)
                            .onTapGesture {
                                toggleItem(item)
                            }

                        Text(item.title)
                            .strikethrough(item.isCompleted)
                            .foregroundColor(item.isCompleted ? .gray : .primary)

                        Spacer()
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }

            // 添加按钮
            Button(action: { showingAddSheet = true }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("添加新项目")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("待办事项")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            EditButton()
        }
        .sheet(isPresented: $showingAddSheet) {
            AddItemSheet(items: $items, isPresented: $showingAddSheet)
        }
    }

    func toggleItem(_ item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

// 待办事项数据模型
struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
}

// 添加项目的弹窗
struct AddItemSheet: View {
    @Binding var items: [TodoItem]
    @Binding var isPresented: Bool
    @State private var newItemTitle = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("输入新项目", text: $newItemTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: addItem) {
                    Text("添加")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(newItemTitle.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(newItemTitle.isEmpty)

                VStack(alignment: .leading, spacing: 10) {
                    Text("💡 学习要点：")
                        .font(.headline)
                    Text("• @State 管理数组数据")
                    Text("• ForEach 遍历可识别对象")
                    Text("• onDelete: 滑动删除")
                    Text("• onMove: 长按拖动排序")
                    Text("• .sheet: 弹出模态窗口")
                    Text("• @Binding: 传递状态绑定")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding()

                Spacer()
            }
            .navigationTitle("添加新项目")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        isPresented = false
                    }
                }
            }
        }
    }

    func addItem() {
        guard !newItemTitle.isEmpty else { return }
        items.append(TodoItem(title: newItemTitle))
        newItemTitle = ""
        isPresented = false
    }
}
