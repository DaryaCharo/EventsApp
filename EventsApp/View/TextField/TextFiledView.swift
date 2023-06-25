//
//  TextFieldView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 22.06.23.
//

import SwiftUI

struct TextFieldView: View {
    
    @StateObject var vm = TextFieldVM()
    let textFieldName: String
    let placeholder: String
    var text: Binding<String>
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text(textFieldName)
                .font(.customFont(type: .regular,
                                       size: 12))
                .foregroundColor(.customWindowBack)
                .padding(.leading, 24)
            
            TextField(placeholder, text: $vm.text)
                .font(.customFont(type: .regular,
                                       size: 16))
                .autocapitalization(.none)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .background(Color.customRed)
                .border(Color.customYellow)
                .cornerRadius(24)
                .padding(.horizontal, 24)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldName: "Text Filed Name",
                      placeholder: "Placeholder",
                      text: .constant(""))
    }
}
