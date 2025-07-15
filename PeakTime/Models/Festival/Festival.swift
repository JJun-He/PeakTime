//
//  Models/Festival.swift
//  PeakTime
//
//

import Foundation
import FirebaseFirestore

struct Festival: Identifiable, Codable {
    @DocumentID var id: String?
    let title: String
    let description: String
    let location: FestivalLocation
    let startDate: Date
    let endDate: Date
    let category: FestivalCategory
    let imageURLs: [String]
    let tags: [String]
    let isFree: Bool
    let ticketPrice: Int?
    let organizerInfo: String
    let websiteURL: String?
    let phoneNumber: String?
    
    // 계산 속성
    var isOngoing: Bool {
        let now = Date()
        return now >= startDate && now <= endDate
    }
    
    var isUpcoming: Bool {
        return startDate > Date()
    }
    
    var daysUntilStart: Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: Date(), to: startDate).day ?? 0
    }
}

struct FestivalLocation: Codable {
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let district: String
}

enum FestivalCategory: String, CaseIterable, Codable {
    case music = "음악"
    case food = "음식"
    case culture = "문화"
    case art = "예술"
    case sports = "스포츠"
    case nature = "자연"
    case technology = "기술"
    case traditional = "전통"
    
    var icon: String {
        switch self {
        case .music: return "music.note"
        case .food: return "fork.knife"
        case .culture: return "theatermasks"
        case .art: return "paintbrush"
        case .sports: return "sportscourt"
        case .nature: return "leaf"
        case .technology: return "desktopcomputer"
        case .traditional: return "building.columns"
        }
    }
}
