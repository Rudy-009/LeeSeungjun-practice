//
//  SheetExample.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/29/25.
//

import SwiftUI

struct SheetExample: View {
    @State private var showSheet = false

    var body: some View {
        VStack {
            Text("메인 화면")
                .font(.largeTitle)

            Button("시트 열기") {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            // SheetView()
            SheetView(sheetIsPresented: $showSheet)
        }
    }
}

struct SheetView: View {
    // @Environment(\.dismiss) var dismiss
    @Binding var sheetIsPresented: Bool
    var body: some View {
        VStack(spacing: 20) {
            Text("시트 화면")
                .font(.largeTitle)

            Button("닫기") {
                // dismiss()
                sheetIsPresented = false
            }
        }
    }
}

#Preview {
    SheetExample()
}
