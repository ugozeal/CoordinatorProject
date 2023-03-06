//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import SwiftUI

struct OnboardingView: View {
    var doneClicked: ()-> ()
    var body: some View {
        TabView {
            ScaledImageView(name: "image1")
                .tag(0)
            
            ScaledImageView(name: "image2")
                .tag(1)
            
            ScaledImageView(name: "image3")
                .tag(2)
            
            ScaledImageView(name: "image4")
                .tag(3)
            
            Button("Done") {
                doneClicked()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black.ignoresSafeArea())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneClicked: {})
    }
}
