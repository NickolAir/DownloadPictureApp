import UIKit

enum DownloadOptions {
    enum From {
        case disk
        case memory
    }

    case circle
    case cached(From)
    case resize
}

extension UIImage {
    func circleImage() -> UIImage? {
        let size = min(self.size.width, self.size.height)
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        UIBezierPath(ovalIn: rect).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
