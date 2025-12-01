//
//  GridExample.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/29/25.
//

import SwiftUI

struct GridExample: View {
    var body: some View {
        HStack {
            Text("A")
            Text("B")
        }
        HStack {
            Text("C")
            Text("D")
        }
        Grid {
            GridRow {
                Text("A")
                Text("B")
            }
            GridRow {
                Text("C")
                Text("D")
            }
        }
        Grid(horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) {_ in
                    RoundedRectangle(cornerRadius: 4)
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
                }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) {_ in
                    RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                    .frame(width: 40, height: 40)
                }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) {_ in
                    RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    GridExample()
}
