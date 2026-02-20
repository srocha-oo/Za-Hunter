//
//  LocationDetailsView.swift
//  Za-Hunter
//
//  Created by stephanie rocha marquez on 2/20/26.
//

import SwiftUI
import MapKit
struct LocationDetailsView: View {
    let mapItem: MKMapItem
    var body: some View {
        let address = mapItem.placemark.subThoroughfare! + " " +
        mapItem.placemark.thoroughfare! + "\n" +
        mapItem.placemark.locality! + ", " +
        mapItem.placemark.administrativeArea! + " " + mapItem.placemark.postalCode!
        VStack {
        Text(mapItem.placemark.name!).font(.title).bold()
        Text(address).padding()
            Text(mapItem.phoneNumber!) .padding()
        Spacer ()
        }
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
