//
//  ContentView.swift
//  EasyChef
//
//  Created by Hasan Akoglu on 24/09/2020.
//

import SwiftUI
import AVFoundation
import AVKit
import WebKit

struct ContentView: View {
    var body: some View {
        UITableView.appearance().separatorColor = .clear
        UITableViewCell.appearance().backgroundColor = .none
        
        return NavigationView {
            List {
                Cards()
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 16))
            }
            .listStyle(GroupedListStyle())
            .padding(.bottom, -32)

            .navigationBarTitle(Text("Recipes"))
            
            //TODO: - Future implementation of favourites button on nav bar
            
//            .navigationBarItems(
//                trailing:
//                Button(action: { print("fav view") }) {
//                    Image(systemName: "heart")
//                }
//            )
        }
    }
}

//TODO: - Future implementation of favourites buttons on recipes

//struct LikeButton: View {
//    @AppStorage("isPressed") var isPressed = false
//
//    var body: some View {
//        return ZStack() {
//            Image(systemName: "heart.fill")
//                .opacity(isPressed ? 1 : 0)
//                .scaleEffect(isPressed ? 1.0 : 0.1)
//                .animation(.linear)
//            Image(systemName: "heart")
//        }.font(.system(size: 20))
//        .padding(.trailing, 10)
//        .padding(.bottom, 5)
//            .onTapGesture {
//                self.isPressed.toggle()
//        }
//        .foregroundColor(isPressed ? .red : .red)
//    }
//}

struct Cards: View {
    var meals: [Meals] = data
    
    var body: some View {
        ForEach(meals, id: \.self) { item in
            VStack(spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                HStack() {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(item.name)
                            .font(.title)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(item.duration)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                    
                    NavigationLink(destination: DetailsView(title: item.name)) {
                    }.opacity(0)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                        .font(Font.body.weight(.semibold))
                }
                .padding(.all, 16)
                .background(Color.yellow)
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
