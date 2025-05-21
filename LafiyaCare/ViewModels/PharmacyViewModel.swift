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
    
    func fetchEmergencyPharmacies() async -> [EmergencyPharmacy] {
        let db = Firestore.firestore()
        var fetchedPharmacies: [EmergencyPharmacy] = []

        do {
            let docSnapshot = try await db.collection("pharmacies_de_garde").document("current").getDocument()
            if let data = docSnapshot.data(),
               let pharmaciesArray = data["Emergencies"] as? [[String: Any]] {
                for dict in pharmaciesArray {
                    if let name = dict["name"] as? String,
                       let id = dict["id"] as? String {
                        let pharmacy = EmergencyPharmacy(name: name, id: id)
                        fetchedPharmacies.append(pharmacy)
                    }
                }
            }
        } catch {
            print("Error getting document: \(error)")
        }

        return fetchedPharmacies
    }

}


