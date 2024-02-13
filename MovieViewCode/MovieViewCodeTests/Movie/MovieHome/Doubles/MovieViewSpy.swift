import Foundation
import UIKit

@testable import MovieViewCode

final class MovieViewSpy: UIView, MovieViewType {
    var didSelect: ((Movie) -> Void)?

    private(set) var showReadyCount = 0
    private(set) var showLoadingCount = 0
    private(set) var expectedMovies: [Movie]?

    func show(state: MovieState) {
        switch state {
        case .ready(let movies):
            showReadyCount += 1
            expectedMovies = movies
        case .loading:
            showLoadingCount += 1
        }
    }
}
