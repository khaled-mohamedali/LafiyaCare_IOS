//
//  SearchBar.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
                   Image(systemName: "magnifyingglass")
                       .foregroundColor(.gray)

                   TextField("Search...", text: $searchText)
                       .autocapitalization(.none)
                       .disableAutocorrection(true)

                   if !searchText.isEmpty {
                       Button(action: {
                           searchText = ""
                       }) {
                           Image(systemName: "xmark.circle.fill")
                               .foregroundColor(.gray)
                       }
                   }
               }
               .padding(8)
               .background(Color(.systemGray6))
               .cornerRadius(30)
               .padding(.horizontal)
    }
}
