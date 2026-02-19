//
//  ContentView.swift
//  Za-Hunter
//
//  Created by stephanie rocha marquez on 2/9/26.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State private var startPosition = MapCameraPosition.userLocation(fallback:
            .automatic)
    @State private var mapRegion = MKCoordinateRegion()
    var body: some View {
        NavigationView {
            Map (position: $startPosition) {
                UserAnnotation ()
            }
            .navigationBarTitle("'Za Hunter", displayMode: .inline)
            .toolbarBackground(.hidden, for:
                    .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
