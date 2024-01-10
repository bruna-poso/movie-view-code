import UIKit

final class MovieRepository: MovieRepositoryType {
    
    private let http: APIClient
    
    init(http: APIClient) {
        self.http = http
    }
    
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
}
