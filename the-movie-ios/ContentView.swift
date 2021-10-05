//
//  ContentView.swift
//  the-movie-ios
//
//  Created by Junior Braga on 09/05/21.
//
import SwiftUI

struct ContentView: View {
    @State var filmesSeries = [MovieSeries]()
    @State var currentPage = 1
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            Text("Bem Vindo")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            Text("Selecione o filme")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(hex: "#00C4FF"))
        }.padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 16))
        
        List(self.filmesSeries){ movieSeriesItem in
            HStack() {
                RemoteImage(url: "https://image.tmdb.org/t/p/w185" + movieSeriesItem.poster_path!)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(movieSeriesItem.title!).frame(maxWidth: .infinity, alignment: .leading)
                    StarsView(rating: Float(movieSeriesItem.vote_average!)).frame(maxWidth: .infinity, alignment: .leading)
                }
                    
            }
        }.onAppear(){self.loadData()}
    }
    
    func loadData() {
        ServiceRequest.shared.fetchFilms(page: self.currentPage,dataResponseJSON:{ (object) in
            filmesSeries = (object?.results)!
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
