//
//  Navigation.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/29/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView()
            } label: {
                Label("Work Folder", systemImage: "folder")
            }
            
            NavigationLink("Teal") {
                ColorDetail(color: .teal)
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Hello World!")
    }
}

struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}


#Preview {
    NavigationExample()
}
