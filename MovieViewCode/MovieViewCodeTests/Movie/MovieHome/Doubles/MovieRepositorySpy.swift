import Foundation

@testable import MovieViewCode

enum MovieRepositoryError: Error {
    case genericError
}

final class MovieRepositorySpy: MovieRepositoryType {
    var handleFetchMovie: Result<MovieViewCode.MovieList, Error>?

    private(set) var fetchMoviesCount = 0
    
    func fetchMovies(completion: @escaping (Result<MovieViewCode.MovieList, Error>) -> Void) {
        fetchMoviesCount += 1

        if let handleFetchMovie = handleFetchMovie {
            completion(handleFetchMovie)
        } else {
            completion(.failure(MovieRepositoryError.genericError))
        }
    }
}

