//
//  ContentView.swift
//  SnowSeeker
//
//  Created by wizz on 3/12/22.
//

import SwiftUI


extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        }else{
            self
        }
    }
}

struct ContentView: View {
    
    @StateObject var favourites = Favourites()
    @State private var searchText = ""
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var body: some View {
        NavigationView {
            List(filteredResorts){ resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack{
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favourites.contains(resort){
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favourite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            
            WelcomeView()
        }
        .environmentObject(favourites)
        //.phoneOnlyNavigationView()
    }
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        }else{
            return resorts.filter { $0.name.localizedStandardContains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
