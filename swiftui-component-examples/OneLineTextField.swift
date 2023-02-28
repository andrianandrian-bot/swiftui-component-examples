//
//  OneLineTextField.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import SwiftUI

struct OneLineTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .font(.system(size: 20, weight: .regular, design: .default))
                .padding(.bottom, 3)
                .labelsHidden()
            Divider()
                .background(Color.mainPurple)
                .foregroundColor(.mainPurple)
        }
    }
}

struct OneLineTextField_Previews: PreviewProvider {
    static var previews: some View {
        OneLineTextField(text: .constant(""))
    }
}
