import Foundation

final class APIClient {
//    func request(_ resource: MovieService, completion: @escaping ((Result<Data,Error>) -> Void)) {
//        let request = URLRequest(url: resource.url)
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            DispatchQueue.main.async {
//                guard let `data` = data else {
//                    guard let error = error else { return }
//                    completion(.failure(error))
//                    return
//                }
//                if let `error` = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                completion(.success(data))
//            }
//        }
//        task.resume()
//    }
    
    func request<T: Decodable>(_ resource: MovieService, decodingType: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        let request = URLRequest(url: resource.url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    }
                    return
                }
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

//final class APIClient {
//    public func request(_ resource: MovieService, completion: @escaping (Result<MovieList, Error>) -> ())  {
//        let request = URLRequest(url: resource.url)
//        let task = URLSession.shared.dataTask(with: request) { data, _,error in
//            if let data = data {
//                /// do exception handler so that our app does not crash
//                do {
//                    let result = try JSONDecoder().decode(MovieList.self, from: data)
//                    completion(.success(result))
//                } catch {
//                    print(error.localizedDescription)
//                    completion(.failure(error))
//                }
//            }
//        }
//        task.resume()
//    }
//}
