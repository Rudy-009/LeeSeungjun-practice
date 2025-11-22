//
//  ContentView.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .foregroundStyle(.green)
                    .frame(width: 100)
                Text("Hello")
                    .background(Color.red)
                Text("World")
                    .background(Color.yellow)
                    .font(.largeTitle)
            }
            .padding()
            .background(Color.gray)
            HStack {
                Rectangle()
                    .tint(Color.green)
                    .frame(width: 100)
                    .frame(width: 100, height: 100)
                Text("Hello")
                    .background(Color.red)
                Spacer()
                Text("World")
                    .background(Color.yellow)
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(Color.gray)
            ZStack {
                Text("Hello \n Hello\n Hello")
                    .background(Color.red)
                Text("World")
                    .background(Color.yellow)
                    .font(.headline)
            }
            .padding()
            .background(Color.gray)
        }
        HStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text("이명진")
                        .font(.headline)
                    Text("문정동")
                        .font(.subheadline)
                }
                Text("확인했습니다. 감사합니다 :)")
            }
            Spacer()
            Image(.thumbnail)
                .frame(width: 40, height: 40)
                .cornerRadius(4)
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
