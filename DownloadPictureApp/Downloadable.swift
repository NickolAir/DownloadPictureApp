import Foundation
import UIKit

protocol Downloadable {

    func loadImage(from url: URL, withOptions: [DownloadOptions])

}

extension Downloadable where Self: UIImageView {

    func loadImage(from url: URL, withOptions: [DownloadOptions]) {

        

    }

}
