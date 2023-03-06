//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import SwiftUI

struct ScaledImageView: View {
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
