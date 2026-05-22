import UIKit

final class DinoService {
    
    static let shared = DinoService()
    
    private init() {}
    
    func fetchDinos(completion: @escaping (Result<[Dino], Error>) -> Void) {
        guard let url = URL(string: "https://dino-api.free.beeceptor.com/dinos") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let decodedDinos = try decoder.decode([Dino].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedDinos))
                }
            } catch {
                print("Ошибка декодирования: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

            print("Данные успешно долетели, их размер \(data.count) байт")
        }
        
        task.resume()
    }
}
