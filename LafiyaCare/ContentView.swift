//
//  ContentView.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import SwiftUI

struct ContentView: View {
    @State  var searchText = ""
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            Spacer()
        }
       
    }
}

#Preview {
    ContentView()
}
