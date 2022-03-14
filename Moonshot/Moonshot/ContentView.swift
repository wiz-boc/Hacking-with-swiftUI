//
//  ContentView.swift
//  Moonshot
//
//  Created by wizz on 2/6/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missons: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(missons){ misson in
                        NavigationLink{
                            MissionView(mission: misson, astronauts: astronauts)
                        }label: {
                            VStack{
                                Image(misson.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack{
                                    Text(misson.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(misson.formattedLaunchDate)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                        
                    }
                }
                .padding([.horizontal,.bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
//        GeometryReader{ geo in
//        Image("profile_pic")
//            .resizable()
//            .scaledToFit()
//            .frame(width: geo.size.width * 0.8)
//            .frame(width: geo.size.width, height: geo.size.height)
//        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
