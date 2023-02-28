//
//  GradientButton.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import SwiftUI

struct GradientButton: View {
    
    var title: String = ""
    var isLoading: Bool = false
    var isDisable: Bool = false
    var onClick: () -> Void = {}
    
    var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                ProgressView()
                    .progressViewStyle(.circular)
                    .opacity(isLoading ? 1 : 0)
                
                Text(title)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .opacity(isLoading ? 0 : 1)
            }
            .frame(height: 49)
            .padding(.horizontal)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .green]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .clipShape(Capsule())
        }
        .disabled(isLoading || isDisable)
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(title: "Button", isLoading: true)
    }
}
