//
//  MapView.swift
//  PeakTime
//
//  Created by 임뚱보 on 7/11/25.
//

import SwiftUI
import MapKit
import UIKit

// 기본 지도 뷰 컨트롤러
class SimpleMapViewController: UIViewController {
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupInitialLocation()
    }
    
    private func setupMapView() {
        view.backgroundColor = .systemBackground
        
        // 지도 뷰 설정
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        
        view.addSubview(mapView)
        
        // Auto Layout 제약 조건 설정
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupInitialLocation() {
        // 서울 시청을 중심으로 초기 위치 설정
        let center = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780)
        let region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        // 기본 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "서울 시청"
        annotation.subtitle = "서울특별시"
        mapView.addAnnotation(annotation)
    }
    
}

// MKMapViewDelegate 구현
extension SimpleMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "SimpleAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
        
    }
}






// SwiftUI에서 UIKit 뷰 컨트롤러를 사용하기 위한 래퍼
struct SimpleMapViewControllerRespresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> SimpleMapViewController {
        return SimpleMapViewController()
    }
    
    func updateUIViewController(_ uiViewController: SimpleMapViewController, context: Context) {
        // 필요 시 업데이트 로직 구현
    }
}


#Preview("기본 지도 뷰"){
    SimpleMapViewControllerRespresentable()
        .preferredColorScheme(.dark)
}
