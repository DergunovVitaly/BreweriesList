//
//  UIImage+Ext.swift
//
//
//  Created by Vitalii Derhunov on 25.10.2019.
//  Copyright © 2019 Vitalii Derhunov. All rights reserved.
//

import UIKit
import Kingfisher

typealias KingfisherCompletion = ((Result<RetrieveImageResult, KingfisherError>) -> Void)?

private struct ImageResource: Resource {
    var cacheKey: String
    var downloadURL: URL

    init(url: URL) {
        downloadURL = url
        cacheKey = url.relativePath
    }
}

extension UIImage {
    static func image(from color: UIColor, size: CGSize) -> UIImage? {
        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale
        format.opaque = false

        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let image = renderer.image { context in
            color.setFill()
            let rect = CGRect(origin: .zero, size: size)
            context.fill(rect)
        }
        return image
    }
}

extension UIImageView {
    func loadImage(fromUrl url: URL, placeHolder: UIImage? = nil, completion: KingfisherCompletion = nil) {
        let options: KingfisherOptionsInfo = [.transition(.fade(0.25)), .diskCacheExpiration(.days(7))]
        guard url.isFileURL else {
            let resource = ImageResource(url: url)
            kf.setImage(with: resource, placeholder: placeHolder, options: options, completionHandler: completion)
            return
        }
        let localImageProvider = LocalFileImageDataProvider(fileURL: url, cacheKey: Date().dateString)
        kf.setImage(with: localImageProvider, options: options, completionHandler: completion)
    }
}
