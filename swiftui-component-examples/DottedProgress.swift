//
//  DottedProgress.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import SwiftUI

struct DottedProgress: View {
    
    var itemsAmount: Int = 6
    var selectedItemIndex: Int = 5
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<itemsAmount) { index in
                let isSelectedItem = index == selectedItemIndex
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundColor(isSelectedItem ? .white : .white.opacity(0.6))
            }
        }
    }
}

struct DottedProgress_Previews: PreviewProvider {
    static var previews: some View {
        DottedProgress()
    }
}
