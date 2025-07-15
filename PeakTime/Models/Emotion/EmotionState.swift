//
//  EmotionState.swift
//  PeakTime
//
//

import Foundation
import SwiftUI

enum EmotionState: String, CaseIterable, Codable {
    case joyful = "joyful" // 기쁨
    case excited = "excited" // 흥분
    case calm = "calm" // 평온
    case energetic = "energetic" // 활기
    case contemplative = "contemplative" // 사색적
    case social = "social" // 사교적
    case adventurous = "adventurous" // 모험적
    case peaceful = "peaceful" // 평화로운
    case romantic = "romantic"
    case creative = "creative"
    
    var displayName: String{
        switch self{
        case .joyful: return "기쁨"
        case .excited: return "흥분"
        case .calm: return "평온"
        case .energetic: return "활기"
        case .contemplative: return "사색적"
        case .social: return "사교적"
        case .adventurous: return "모험적"
        case .peaceful: return "평화로운"
        case .romantic: return "로맨틱"
        case .creative: return "창의적"
        }
    }
    
    var color: Color{
        switch self{
        case .joyful: return Color(hex: "#FFD700")      // 골드
        case .excited: return Color(hex: "#FF6B35")     // 오렌지
        case .calm: return Color(hex: "#4A90E2")        // 블루
        case .energetic: return Color(hex: "#FF1744")   // 레드
        case .contemplative: return Color(hex: "#9C27B0") // 퍼플
        case .social: return Color(hex: "#4CAF50")      // 그린
        case .adventurous: return Color(hex: "#FF9800") // 앰버
        case .peaceful: return Color(hex: "#81C784")    // 라이트그린
        case .romantic: return Color(hex: "#E91E63")    // 핑크
        case .creative: return Color(hex: "#8E24AA")    // 바이올렛
        }
    }
    
    var icon: String {
        switch self {
        case .joyful: return "face.smiling"
        case .excited: return "bolt.fill"
        case .calm: return "leaf.fill"
        case .energetic: return "flame.fill"
        case .contemplative: return "brain.head.profile"
        case .social: return "person.2.fill"
        case .adventurous: return "mountain.2.fill"
        case .peaceful: return "heart.fill"
        case .romantic: return "heart.circle.fill"
        case .creative: return "paintbrush.pointed.fill"
        }
    }
    
    var description: String {
         switch self {
         case .joyful: return "밝고 즐거운 기분으로 신나는 축제를 원해요"
         case .excited: return "에너지 넘치는 흥미진진한 경험을 찾고 있어요"
         case .calm: return "차분하고 여유로운 분위기의 축제를 선호해요"
         case .energetic: return "활동적이고 다이나믹한 축제를 좋아해요"
         case .contemplative: return "생각할 거리가 있는 의미 있는 축제를 원해요"
         case .social: return "사람들과 어울리며 소통할 수 있는 축제를 찾아요"
         case .adventurous: return "새로운 경험과 도전이 있는 축제를 원해요"
         case .peaceful: return "마음의 평화를 찾을 수 있는 조용한 축제를 선호해요"
         case .romantic: return "연인과 함께 로맨틱한 분위기를 즐기고 싶어요"
         case .creative: return "예술적이고 창의적인 영감을 받을 수 있는 축제를 원해요"
         }
     }
    
    // 호환되는 감정들 (추천 시 사용)
    var compatibleEmotions: [EmotionState] {
        switch self {
        case .joyful:
            return [.excited, .social, .energetic]
        case .excited:
            return [.energetic, .adventurous, .joyful]
        case .calm:
            return [.peaceful, .contemplative, .creative]
        case .energetic:
            return [.excited, .adventurous, .social]
        case .contemplative:
            return [.calm, .peaceful, .creative]
        case .social:
            return [.joyful, .energetic, .excited]
        case .adventurous:
            return [.excited, .energetic, .social]
        case .peaceful:
            return [.calm, .contemplative, .romantic]
        case .romantic:
            return [.peaceful, .joyful, .creative]
        case .creative:
            return [.contemplative, .peaceful, .romantic]
        }
    }
}

// 감정 강도 레벨
enum EmotionIntensity: Int, CaseIterable, Codable {
    case low = 1
    case medium = 2
    case high = 3
    case veryHigh = 4
    
    var displayName: String {
        switch self {
        case .low: return "약간"
        case .medium: return "보통"
        case .high: return "강하게"
        case .veryHigh: return "매우 강하게"
        }
    }
    
    var multiplier: Double {
        return Double(self.rawValue) * 0.25
    }
}

