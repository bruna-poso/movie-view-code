import UIKit

final class MovieRepository: MovieRepositoryType {

    private let http: APIClient
    
    init(http: APIClient) {
        self.http = http
    }

//    func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
//        // TODO: É uma sugestão, depois verifique se você não consegue fazer algo genérico para isso. Passar esse bloco para o apiclient e ele já te retornar um objeto. O projeto do C6 faz isso, você pode te-lo como exemplo.
//        http.request(MovieService.popular) { result in
//            switch result {
//            case .failure(let error):
//                completion(.failure(error))
//            case .success(let data):
//                do {
//                    let object = try JSONDecoder().decode(MovieList.self, from: data)
//                    completion(.success(object))
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
    
    func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
        http.request(MovieService.popular, decodingType: MovieList.self) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let movieList):
                completion(.success(movieList))
            }
        }
    }
    
//    func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
//        http.request(MovieService.popular) { result in
//            switch result {
//            case .failure(let error):
//                completion(.failure(error))
//            case .success(let object):
//                completion(.success(object))
//            }
//        }
//    }
}
