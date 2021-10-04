//
//  ContentView.swift
//  the-movie-ios
//
//  Created by Junior Braga on 09/05/21.
//
import SwiftUI

struct ContentView: View {
    @State var filmesSeries = [MovieSeries]()
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(filmesSeries, id: \.id) {  item in
                    VStack(alignment: .leading) {
                    RemoteImage(url: "https://image.tmdb.org/t/p/w185" + item.poster_path!)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                    Text(item.title!)
                }
                }
            }
        }.onAppear(){loadData()}
    }
    
    func loadData() {
        ServiceRequest.shared.fetchFilms(page: 1,dataResponseJSON:{ (object) in
            filmesSeries = (object?.results)!
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
