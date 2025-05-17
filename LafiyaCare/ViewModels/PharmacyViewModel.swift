//
//  PharmacyViewModel.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import Foundation

import FirebaseFirestore

class PharmacyViewModel{
 
    
    func getData() async ->[Pharmacy]  {
        let db = Firestore.firestore()
        var fetchPharmacies : [Pharmacy] = []
        
        do{
            let snapshot =   try await db.collection("pharmacies_niamey").getDocuments()
            for document in snapshot.documents {
                if let pharmacy = try? document.data(as: Pharmacy.self){
                    fetchPharmacies.append(pharmacy)
                }
            }
        }catch{
            print("Error getting documents: \(error)")
        }
      
        return fetchPharmacies
    }
}


