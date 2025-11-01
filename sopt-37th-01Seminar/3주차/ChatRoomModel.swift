//
//  ChatRoomModel.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 11/1/25.
//

import UIKit

struct ChatRoomModel {
    let profileImage: UIImage?
    let name: String
    let location: String
    let lastMessage: String
    let thumbnail: UIImage?
    
    static let mockData: [ChatRoomModel] = [
        ChatRoomModel(profileImage: .profileDefault, name: "이명진", location: "대한민국", lastMessage: "확인했습니다 감사합니다 :)", thumbnail: .productSmall1),
        ChatRoomModel(profileImage: .profile1, name: "신혜연", location: "일본", lastMessage: "넵 수고하세용 ㅋ", thumbnail: .productSmall2),
        ChatRoomModel(profileImage: .profile2, name: "안치욱", location: "중국", lastMessage: "니 하오마....", thumbnail: .productSmall3),
        ChatRoomModel(profileImage: .profile3, name: "선영주", location: "미국", lastMessage: "오빠 나 미미나 힘들어.", thumbnail: .productSmall4),
        ChatRoomModel(profileImage: .profile4, name: "이나연", location: "프랑스", lastMessage: "네.", thumbnail: .productSmall5),
        ChatRoomModel(profileImage: .profile5, name: "김나연", location: "영국", lastMessage: "김나연님이 이모티콘을 보냈어요.", thumbnail: .productSmall6),
        ChatRoomModel(profileImage: .profileDefault, name: "이서현", location: "독일", lastMessage: "이서현님이 이모티콘을 보냈어요.", thumbnail: .productSmall7),
        ChatRoomModel(profileImage: .profile1, name: "조영서", location: "이탈리아", lastMessage: "옷 예쁘네요! 얼마죠?", thumbnail: .productSmall8),
        ChatRoomModel(profileImage: .profile2, name: "박정환", location: "스페인", lastMessage: "네고좀 해주세요.", thumbnail: .productSmall9),
        ChatRoomModel(profileImage: .profile3, name: "진소은", location: "캐나다", lastMessage: "감사합니다! 조심하가세요~!", thumbnail: .productSmall10)
    ]
    
}




