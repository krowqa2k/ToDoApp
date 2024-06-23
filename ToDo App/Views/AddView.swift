//
//  AddView.swift
//  ToDo App
//
//  Created by admin on 21/06/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var datePickField: Date = .now
    @FocusState private var keyboardFocused: Bool
    
    let color: UIColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Add something...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 66)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .focused($keyboardFocused)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.keyboardFocused = true
                            }
                        }
                    DatePicker("",selection: $datePickField, displayedComponents: .date)
                        .labelsHidden()
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        
                    Spacer()
                }
                
                Button(action: saveButtonPressed, label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .disabled(textFieldText.count < 3)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✍️")
        
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        dismiss()
    }
    
}
#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
