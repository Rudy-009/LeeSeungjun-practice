//
//  ListScroll.swift
//  SOPT_SwiftUI_Tutorial
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI

// MARK: ChatRoomModel

struct ChatRoomModel: Identifiable {
    let id = UUID()
    let profileImage: Image?
    let name: String
    let location: String
    let lastMessage: String
    let thumbnail: Image?
}

// MARK: - Mock Data
extension ChatRoomModel {
    static let mockData: [ChatRoomModel] = [
        ChatRoomModel(
            profileImage: nil,
            name: "이명진",
            location: "문정동",
            lastMessage: "확인했습니다 감사합니다 :)",
            thumbnail: Image(systemName: "pencil.and.outline")
        ),
        ChatRoomModel(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            name: "chan",
            location: "구의동",
            lastMessage: "넘 수고하세용",
            thumbnail: Image(systemName: "figure.run")
        ),
        ChatRoomModel(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            name: "오지",
            location: "부문동2가",
            lastMessage: "안녕하세요 탈장이 너무 높았네여 ㅎ",
            thumbnail: Image(systemName: "headphones")
        ),
        ChatRoomModel(
            profileImage: nil,
            name: "누룽지",
            location: "면목동",
            lastMessage: "이랍다님이 이모티콘을 보냈어요.",
            thumbnail: Image(systemName: "paintbrush.pointed.fill")
        ),
        ChatRoomModel(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            name: "kenny",
            location: "자양제4동",
            lastMessage: "네.",
            thumbnail: Image(systemName: "camera.fill")
        ),
        ChatRoomModel(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            name: "자리보금",
            location: "옥수동",
            lastMessage: "자리보금님이 이모티콘을 보냈어요.",
            thumbnail: Image(systemName: "popcorn.fill")
        ),
        ChatRoomModel(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            name: "리빙스텝",
            location: "면목동",
            lastMessage: "리빙스텝님이 이모티콘을 보냈어요.",
            thumbnail: Image(systemName: "shoeprints.fill")
        )
    ]
}

// MARK: ChatRow

struct ChatRow: View {
    let chatRoom: ChatRoomModel // 모델 추가
    
    var body: some View {
//        HStack(alignment: .center, spacing: 16) {
//            // 왼쪽 프로필 아이콘
//            ZStack {
//                Circle()
//                    .fill(Color.gray.opacity(0.2))
//                    .frame(width: 50, height: 50)
//                
//                if let profileImage = chatRoom.profileImage {
//                    profileImage
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                } else {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.gray)
//                }
//            }
//            
//            // 가운데 텍스트 영역
//            VStack(alignment: .leading, spacing: 4) {
//                HStack(spacing: 4) {
//                    Text(chatRoom.name)
//                        .font(.system(size: 16, weight: .semibold))
//                        .foregroundColor(.black)
//                    
//                    Text(chatRoom.location)
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                }
//                
//                Text(chatRoom.lastMessage)
//                    .font(.system(size: 14))
//                    .foregroundColor(.gray)
//                    .lineLimit(1)
//            }
//            
//            Spacer()
//            
//            // 오른쪽 썸네일 이미지
//            if let thumbnail = chatRoom.thumbnail {
//                thumbnail
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 50, height: 50)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
//            }
//        }
//        .padding(.horizontal, 16)
//        .padding(.vertical, 12)
//        .background(Color.white)
        HStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(chatRoom.name)
                        .font(.headline)
                    Text(chatRoom.location)
                        .font(.subheadline)
                }
                Text(chatRoom.lastMessage)
            }
            .padding([.leading], 8)
            Spacer()
            chatRoom.thumbnail
                .frame(width: 40, height: 40)
                .cornerRadius(4)
        }
        .padding(16)
    }
}

// MARK: ChatList.swift

struct ChatList: View {
    let chatRooms: [ChatRoomModel]
    
    var body: some View {
        List(chatRooms) { chatRoom in
            ChatRow(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets()) // inset 타이트하게 맞춰줍니다.
                .listRowSeparator(.visible) // 구분선 보이게 함
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                                return -viewDimensions.width
                            }
                .alignmentGuide(.listRowSeparatorTrailing) { viewDimensions in
                                return +viewDimensions.width
                            }
        }
        .listStyle(.plain) // 기본 스타일
    }
}

#Preview {
    ChatList(chatRooms: ChatRoomModel.mockData) // 데이터 주입
}
