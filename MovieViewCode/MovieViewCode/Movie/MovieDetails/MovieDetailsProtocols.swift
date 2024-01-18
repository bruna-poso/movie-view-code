import UIKit

protocol MovieDetailViewType where Self: UIView {
    func show(viewModel: Movie)
}
