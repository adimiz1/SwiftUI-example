//
//  CloudinaryService.swift
//  Cloudinary-SwiftUI-Sample
//
//  Created by Adi Mizrahi on 05/12/2022.
//

import Foundation
import Cloudinary

class CloudinaryService: ObservableObject {
    var cloudinary: CLDCloudinary?
    @Published var url = ""

    init() {
        getImages()
    }

    func getImages() {
        let config = CLDConfiguration(cloudName: "demo", apiKey: "API_KEY", secure: true)
        cloudinary = CLDCloudinary(configuration: config)
        url = cloudinary!.createUrl().setTransformation(CLDTransformation().setEffect("sepia")).generate("sample.jpg")!

    }
}
