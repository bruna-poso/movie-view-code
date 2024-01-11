import UIKit

protocol MovieRepositoryType {
    func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void)
}

protocol MovieViewType where Self: UIView {
    var didSelect: ((Movie) -> Void)? { get set }
    func show(movies: [Movie])
}
