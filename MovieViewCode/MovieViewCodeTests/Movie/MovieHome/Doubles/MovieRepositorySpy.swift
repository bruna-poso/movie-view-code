import Foundation

@testable import MovieViewCode

final class MovieRepositorySpy: MovieRepositoryType {
    
    var handleFetchMovie: Result<MovieViewCode.MovieList, Error>?

    private(set) var fetchMoviesCount = 0
        
    func fetchMovies(completion: @escaping (Result<MovieViewCode.MovieList, Error>) -> Void) {
        fetchMoviesCount += 1

        if let handleFetchMovie = handleFetchMovie {
            completion(handleFetchMovie)
        } else {
            completion(.failure(NSError(domain: "TestErrorDomain", code: 42, userInfo: nil)))
        }
    }
}
