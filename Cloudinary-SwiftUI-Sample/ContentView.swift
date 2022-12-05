//
//  ContentView.swift
//  Cloudinary-SwiftUI-Sample
//
//  Created by Adi Mizrahi on 30/11/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var cloudinary = CloudinaryService()

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: cloudinary.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 150, maxHeight: 265)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
