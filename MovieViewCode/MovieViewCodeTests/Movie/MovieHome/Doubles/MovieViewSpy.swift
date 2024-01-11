import Foundation
import UIKit

@testable import MovieViewCode

final class MovieViewSpy: UIView, MovieViewType {
    var didSelect: ((Movie) -> Void)?

    private(set) var showCount = 0
    private(set) var expectedMovies: [Movie]?
    
    func show(movies: [Movie]) {
        showCount += 1
        expectedMovies = movies
    }
}
