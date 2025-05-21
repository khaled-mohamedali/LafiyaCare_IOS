//
//  PharmacyCard.swift
//  LafiyaCare
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import SwiftUI

struct PharmacyCard: View {
    @State  var pharmacy: Pharmacy
    @State var emergencyPharmacies: [EmergencyPharmacy] = []
    @State private var showAlert = false
    @State private var alertMessage = ""

    
       var body: some View {
           VStack(alignment: .leading, spacing: 10) {
               HStack {
                   // Pharmacy icon
                   Image("pharmacy_logo") // Replace with your asset name
                       .resizable()
                       .frame(width: 40, height: 40)
                       .cornerRadius(8)

                   VStack(alignment: .leading) {
                       
                       Text(pharmacy.name!.capitalized)
                           .font(.headline)
                       
                       // Open in Maps
                       Button(action: {
                           let lat = pharmacy.address?.latitude ?? 0.0
                           let long = pharmacy.address?.longitude ?? 0.0
                           
                           if let url = URL(string: "http://maps.apple.com/?daddr=\(lat),\(long)&dirflg=d"){
                               UIApplication.shared.open(url)
                           }
                          
                          
                       }) {
                           HStack(spacing: 4) {
                               Image(systemName: "mappin.and.ellipse")
                               Text("Voir le trajet")
                                   .font(.subheadline)
                                   .foregroundColor(.blue)
                           }
                       }
                   }

                   Spacer()

                   // Phone icon
                   Button(action: {
                       // Call action
                       let phone = pharmacy.phone ?? ""
                       
                       if !phone.isEmpty{
                           if let url = URL(string: "tel://\(phone)"){
                               UIApplication.shared.open(url)
                           }
                       }else{
                           alertMessage = "Pas de Numéro de Téléphone Disponible"
                           showAlert = true
                           
                       }
                       
                   
                       
                   }) {
                       Image(systemName: "phone.fill")
                           .foregroundColor(.green)
                           .padding(8)
                           .background(Color(.systemGray6))
                           .clipShape(Circle())
                   }.padding(.bottom,20)
                       .alert(isPresented: $showAlert) {
                           Alert(title: Text(alertMessage))
                       }
               }

               HStack {
                   Image(systemName: "clock")
                   Text("• \(pharmacy.openHours!)")
                       .font(.subheadline)

                   Spacer()
                   
                   if pharmacy.isEmergency!{
                       Text("De Garde")
                           .font(.caption)
                           .foregroundColor(.white)
                           .padding(6)
                           .background(Color.red)
                           .cornerRadius(6)
                   }
                      

                   HStack(spacing: 4) {
                       Image(systemName: "star.fill")
                           .foregroundColor(.yellow)
                       Text(String(pharmacy.rating!))
                           .font(.subheadline)
                   }
               }
               .foregroundColor(.secondary)
           }
           .padding()
           .background(Color(.systemBackground))
           .cornerRadius(12)
           .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
           
       }
}
