//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        VStack {
            Text("First Detail")
            
            TextField("name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: FirstTabViewModel())
    }
}
