import UIKit

final class MovieDetailViewController: UIViewController {

    private let contentView: MovieDetailViewType
    private let movie: Movie
    
    init (movie: Movie, contentView: MovieDetailViewType = MovieDetailView()) {
        self.movie = movie
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.show(viewModel: movie)
    }
}
