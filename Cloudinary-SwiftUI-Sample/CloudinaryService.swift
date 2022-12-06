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

    // Constructor
    init() {
        getImages()
    }

    func getImages() {
        // Init config from envirounment variable
        let config = CLDConfiguration.initWithEnvParams()
        // Create Cloudinary object
        cloudinary = CLDCloudinary(configuration: config!)
        // Load local file
        let file = Bundle.main.url(forResource: "corgi", withExtension: "jpg")!
        //Make unsigned upload using upload preset
        cloudinary!.createUploader().upload(url: file, uploadPreset: "unsigned-image", params: CLDUploadRequestParams()).response({
            (response, error) in
            //Update the url string with the new public id from the uploaded asset
            self.url = self.cloudinary!.createUrl().setTransformation(CLDTransformation().setEffect("sepia")).generate((response?.publicId)!)!
        })

    }
}
