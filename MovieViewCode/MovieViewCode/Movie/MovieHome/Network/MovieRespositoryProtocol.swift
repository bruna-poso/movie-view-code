import UIKit

protocol MovieRepositoryType {
    func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void)
}
