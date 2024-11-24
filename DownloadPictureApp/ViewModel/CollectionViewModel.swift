import Foundation

final class CollectionViewModel {
    private let imagesURL = [
        "photo-1542211295-dc548c2aad7c":
            "https://images.unsplash.com/photo-1542211295-dc548c2aad7c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1534859127800-9f05716307cf":
            "https://images.unsplash.com/photo-1534859127800-9f05716307cf?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1503376780353-7e6692767b70":
            "https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1532988633349-d3dfb28ee834":
            "https://images.unsplash.com/photo-1532988633349-d3dfb28ee834?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1531213066468-f248753e56f9":
            "https://images.unsplash.com/photo-1531213066468-f248753e56f9?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1511270157306-995794a27bff":
            "https://images.unsplash.com/photo-1511270157306-995794a27bff?q=80&w=2865&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1548978886-6badb16fc09":
            "https://images.unsplash.com/photo-1548978886-6badb16fc09f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "photo-1533922598206-a1a2594e5873":
            "https://images.unsplash.com/photo-1533922598206-a1a2594e5873?q=80&w=2930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ]
    
    private let imagesCount: Int
    lazy var randomImages: [ImageViewModel] = []
    
    init(imagesCount: Int) {
        self.imagesCount = imagesCount
        generateRandomArray()
    }
    
    private func generateRandomArray() {
        guard imagesCount > 0 else { return }
        
        for _ in 0..<imagesCount {
            if let randomElement = imagesURL.randomElement(),
               let imageURL = URL(string: randomElement.value) {
                randomImages.append(.init(fileName: randomElement.key, imageURL: imageURL))
            }
        }
    }
}
