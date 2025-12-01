//
//  NavigationPathExample.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/29/25.
//

import SwiftUI

struct NavigationPathExample: View {
    @State private var path = NavigationPath() // 이거

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 10) {
                Text("홈 화면")
                    .font(.largeTitle)
                Button("뷰 이동") {
                    path.append(1)
                }
            }
            .navigationDestination(for: Int.self) { step in
                StepView(step: step, path: $path)
            }
        }
    }
}

struct StepView: View {
    let step: Int
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Text("\(step)단계")
                .font(.largeTitle)

            Button("다음으로") {
                path.append(step + 1)
            }

            Button("처음으로") {
                path = NavigationPath()
            }
            
            Button("처음으로 2") {
                path.removeLast(path.count)
            }
        }
    }
}

#Preview {
    NavigationPathExample()
}
