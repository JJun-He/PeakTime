//
//  EmotionState.swift
//  PeakTime
//
//

import Foundation

enum EmotionState: String, CaseIterable, Codable {
    case joyful = "joyful" // 기쁨
    case excited = "excited" // 흥분
    case calm = "calm" // 평온
    case energetic = "energetic" // 활기
    case contemplative = "contemplative" // 사색적
    case social = "social" // 사교적
    case adventurous = "adventurous" // 모험적
    case peaceful = "peaceful" // 평화로운
    
    var displayName: String{
        switch self{
        case .joyful: return "기쁨"
        case .excited: return "흥분"
            
        }
    }
}

