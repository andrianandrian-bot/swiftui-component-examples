//
//  MatchCell.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import SwiftUI
import NukeUI
import SwiftProtobuf

struct MatchCell: View {
    
    let userMatch: UserMatch
    
    var body: some View {
        HStack {
            let path = "https://google.com/\(userMatch.userTarget?.avatar?.mediaPath ?? "")"
            LazyImage(source: path)
                .frame(width: 76, height: 76)
                .clipShape(Circle())
            
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(userMatch.userTarget?.name ?? "")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(.black)
                    
                    if userMatch.isShown == true {
                        Text(userMatch.match?.dialog.lastMessage.text ?? "")
                            .font(.system(size: 15, weight: .light, design: .default))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("Новое совпадение!")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(.mainPurple)
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer()
            }

            VStack {
                Button {
                } label: {
                    if userMatch.isMarked == true {
                        Image(.markedChat)
                    } else {
                        Image(.unmarkedChat)
                    }
                }
                
                if let unreadMessagesCount = userMatch.unreadMessagesCount, unreadMessagesCount > 0 {
                    Text("\(unreadMessagesCount)")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.mainPink)
                        .clipShape(Circle())
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 6)
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(userMatch.isShown == true ? .clear : Color.green.opacity(0.1) )
        .contextMenu {
            Button {
            } label: {
                Label("Удалить чат и совпадение", systemImage: "xmark.bin.circle.fill")
            }
            
            Button {
            } label: {
                Label("Отметить чат", systemImage: "bookmark.fill")
            }
        }
    } // body
    
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell(userMatch: UserMatch())
    }
}
