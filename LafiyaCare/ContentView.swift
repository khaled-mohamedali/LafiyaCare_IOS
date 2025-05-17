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
    
   
   
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            Spacer()
            List(pharmacies){ pharmacy in
                PharmacyCard(pharmacy: pharmacy)
               
            
            }
            
            Spacer()
              
            
            }
            .task {
                pharmacies = await pharmacyViewModel.getData()
            }
        }
       
}


#Preview {
    ContentView()
}
