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
        let config = CLDConfiguration.initWithEnvParams()
        cloudinary = CLDCloudinary(configuration: config!)
        let file = Bundle.main.url(forResource: "corgi", withExtension: "jpg")!
        let request = cloudinary!.createUploader().upload(url: file, uploadPreset: "unsigned-image", params: CLDUploadRequestParams()).response({
            (response, error) in
            print(response)
            self.url = self.cloudinary!.createUrl().setTransformation(CLDTransformation().setEffect("sepia")).generate((response?.publicId)!)!
        })

    }
}
