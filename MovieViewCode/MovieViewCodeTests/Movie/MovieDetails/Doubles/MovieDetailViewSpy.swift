import Foundation
import UIKit

@testable import MovieViewCode

final class MovieDetailViewSpy: UIView, MovieDetailViewType {
    private(set) var showCount = 0
    private(set) var expectedViewModel: Movie?
    
    func show(viewModel: Movie) {
        showCount += 1
        expectedViewModel = viewModel
    }
}
