//
//  TopCard.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import SwiftUI
import NukeUI
import SwiftProtobuf

struct TopCard: View {
    
    @State private var isCardDragging = false
    @State private var topCardOffset: CGSize = .zero
    @State private var selectedMediaIndex = 0
    
    @Binding var showReportView: Bool
    @Binding var showChangeSexAlert: Bool
    
    var recommendation: Recommendation
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.gray.opacity(1)
                .cornerRadius(35)
            
            if recommendation.userRecommended.media.count == 0 {
                Text("У юзера нет медиа")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(30)
            }
            
            if !(recommendation.userRecommended.media).isEmpty {
                let path = "https://google.com/\(recommendation.userRecommended.media[selectedMediaIndex].mediaPath)"
                LazyImage(source: path)
                    .cornerRadius(35)
            }
            
            
            VStack {
                HStack {
                    Button {
                        showChangeSexAlert = true
                    } label: {
                        Image(String.filterIcon)
                    }
                    Spacer()
                    DottedProgress(itemsAmount: recommendation.userRecommended.media.count, selectedItemIndex: selectedMediaIndex)
                    Spacer()
                    Button {
                        showReportView = true
                    } label: {
                        Image(String.userMenuIcon)
                    }
                }
                Spacer()
                HStack {
                    let text = "\(recommendation.userRecommended.name), \(18)"
                    Text(text)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                    } label: {
                        Image(String.previous)
                    }
                }
            }
            .padding(25)
            
            HStack {
                Button {
                    selectPreviousMedia()
                } label: {
                    Color.clear
                        .frame(height: 150)
                }
                
                Spacer()
                
                Button {
                    selectNextMedia()
                } label: {
                    Color.clear
                        .frame(height: 150)
                }
            }
            
            
            if isCardDragging {
                VStack {
                    let color = topCardOffset.width < 0 ? Color.red : Color.green
                    LinearGradient(colors: [.clear, color], startPoint: .top, endPoint: .bottom)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                        .cornerRadius(35)
                        .opacity(0.65)
                }
            }
        }
        .offset(x: topCardOffset.width)
        .rotationEffect(.degrees(topCardOffset.width / 20), anchor: .bottom)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            DragGesture()
                .onChanged { transition in
                    isCardDragging = true
                    topCardOffset = transition.translation
                    calcCardDisappear()
                }
                .onEnded { transition in
                    if topCardOffset.width > 250 {
                        topCardOffset.width = 1000
                    } else if topCardOffset.width < -250 {
                        topCardOffset.width = -1000
                    } else {
                        topCardOffset = .zero
                    }
                    isCardDragging = false
                }
        )
    }
    
    private func selectNextMedia() {
        var mediaCount = recommendation.userRecommended.media.count
        mediaCount -= 1
        selectedMediaIndex == mediaCount ? (selectedMediaIndex = 0) : (selectedMediaIndex += 1)
    }
    
    private func selectPreviousMedia() {
        var mediaCount = recommendation.userRecommended.media.count
        mediaCount -= 1
        selectedMediaIndex == 0 ? (selectedMediaIndex = 0) : (selectedMediaIndex -= 1)
    }
    
    private func calcCardDisappear() {
        if topCardOffset.width > 150 {
            topCardOffset.width = 500
        } else if topCardOffset.width < -150 {
            topCardOffset.width = -500
        }
    }
}

struct TopCard_Previews: PreviewProvider {
    
    static var previews: some View {
        TopCard(showReportView: .constant(true),
                showChangeSexAlert: .constant(true),
                recommendation: Recommendation())
    }
    
}
