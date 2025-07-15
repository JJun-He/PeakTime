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
}

