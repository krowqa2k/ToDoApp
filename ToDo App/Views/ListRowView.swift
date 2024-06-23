//
//  ListRowView.swift
//  ToDo App
//
//  Created by admin on 21/06/2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    private var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter.string(from: item.date)
        }
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            Text(formattedDate)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "First item!", isCompleted: false, date: .now))
        ListRowView(item: ItemModel(title: "Second item!", isCompleted: true, date: .now))
    }
    .previewLayout(.sizeThatFits)
}
