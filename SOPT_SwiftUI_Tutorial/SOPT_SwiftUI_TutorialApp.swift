//
//  SOPT_SwiftUI_TutorialApp.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI

@main
struct SOPT_SwiftUI_TutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ChatList(chatRooms: ChatRoomModel.mockData) // 데이터 주입
        }
    }
}
