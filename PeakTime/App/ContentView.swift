//
//  ContentView.swift
//  PeakTime
//
//

import SwiftUI

struct ContentView: View {
    @StateObject private locationManager = LocationManager()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("지도")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("마이페이지")
                }
        }
        .environmentObject(locationManager)
        .onAppear{
            locationManager.requestPermission()
        }
    }
}


