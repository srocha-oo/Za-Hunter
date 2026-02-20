//
//  ContentView.swift
//  Za-Hunter
//
//  Created by stephanie rocha marquez on 2/9/26.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State private var startPosition = MapCameraPosition.userLocation(fallback: .automatic)
    @State private var mapRegion = MKCoordinateRegion()
    @State private var locationManager = LocationManager()
    @State private var places = [Place]()
    var body: some View {
        NavigationView {
            Map(position: $startPosition) {
                UserAnnotation()
                ForEach(places) { place in
                    Annotation(place.mapItem.name!, coordinate: place.mapItem.placemark.coordinate) {
                        NavigationLink(destination: LocationDetailsView(mapItem: place.mapItem)) {
                            Image("pizza")
                        }
                    }
                }
            }
                .onMapCameraChange { context in
                    mapRegion = context.region
                    performSearch(item: "pizza")
                }
            }
        }
        
        func performSearch(item: String) {
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = item
            searchRequest.region = mapRegion
            let search = MKLocalSearch(request: searchRequest)
            
            search.start { response, error in
                if let response = response {
                    places.removeAll()
                    for mapItem in response.mapItems {
                        places.append(Place(mapItem: mapItem))
                    }
                }
            }
        }
    }
    #Preview {
        ContentView()
    }
    struct Place: Identifiable {
        let id = UUID()
        let mapItem: MKMapItem
    }
