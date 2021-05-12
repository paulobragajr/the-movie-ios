//
//  ContentView.swift
//  the-movie-ios
//
//  Created by Junior Braga on 09/05/21.
//

import SwiftUI

struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}
private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]
struct ContentView: View {
    @State var results = []
    var body: some View {
        Text("Hello, worl!")
            .padding()
            
        List(oceans) { item in
            VStack(alignment: .leading) {
                Text(item.name)
            }
        }.onAppear(perform: loadData)
    }
    
    
    func loadData() {
        ServiceRequest.fetchFilms()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
