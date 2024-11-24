import UIKit

class DownloadableImageView: UIImageView, Downloadable {
    
    private var currentDownloadTask: URLSessionDataTask?
    
    // Реализация метода из протокола Downloadable
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        // Отменяем текущую загрузку, если она есть
        currentDownloadTask?.cancel()
        
        // Инициализируем новую загрузку
        currentDownloadTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Очищаем задачу после завершения
            defer { self?.currentDownloadTask = nil }
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "DownloadError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid image data"])))
                }
                return
            }
            
            // Успешно загружено
            DispatchQueue.main.async {
                self?.image = image // Устанавливаем изображение
                completion(.success(image))
            }
        }
        
        // Запускаем задачу
        currentDownloadTask?.resume()
    }
}
