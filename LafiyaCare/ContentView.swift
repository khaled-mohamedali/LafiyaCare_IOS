//
//  ContentView.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import SwiftUI

struct ContentView: View {
    @State  var searchText = ""
    @State var pharmacyViewModel = PharmacyViewModel()
    @State var pharmacies: [Pharmacy] = []
    @State var emergencyPharmacies: [EmergencyPharmacy] = []

    
    var filteredPharmacies: [Pharmacy] {
        if searchText.isEmpty{
            return pharmacies
        }else{
            return pharmacies.filter {
                $0.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    
    var body: some View {
      
        VStack {
            HStack(spacing: 0){
                SearchBar(searchText: $searchText)
                
                Button(action:{
                    pharmacies.sort{$0.isEmergency! && !$1.isEmergency!}
                }){
                    Image(systemName: "arrow.up.and.down.text.horizontal")
                        .padding(.trailing,20)
                }
            }
           
            Spacer()
            
            ScrollView{
                LazyVStack(spacing:5){
                    ForEach(filteredPharmacies){ pharmacy in
                        PharmacyCard(pharmacy: pharmacy,emergencyPharmacies: emergencyPharmacies)
                            .padding([.horizontal,.top], 16)
                    }
                }
            }
            Spacer()

            }
            .task {
                pharmacies = await pharmacyViewModel.getData()
                emergencyPharmacies = await pharmacyViewModel.fetchEmergencyPharmacies()
                
                for pharmacy in pharmacies {
                    if let placeId = pharmacy.placeId , emergencyPharmacies.contains(where: { $0.id == placeId }){
                        pharmacy.setIsEmergency(true)
                    }
                }
            }
        }
       
}


#Preview {
    ContentView()
}
