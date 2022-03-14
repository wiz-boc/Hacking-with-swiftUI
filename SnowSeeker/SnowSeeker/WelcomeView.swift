//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by wizz on 3/12/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
        Text("Welcome to SnowSeeker")
            .font(.largeTitle)
            Text("Please select a resort from the lef-hand menu; swipe from the left edge to show")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
