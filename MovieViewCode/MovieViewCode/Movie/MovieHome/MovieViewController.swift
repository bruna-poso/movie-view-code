import UIKit

final class MovieViewController: UITableViewController {

    private var contentView: MovieViewType
    private var repository: MovieRepositoryType
    
    init(contentView: MovieViewType = MovieView(), 
         repository: MovieRepositoryType = MovieRepository(http: APIClient())) {
        self.contentView = contentView
        self.repository = repository
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
        setup()
    }
    
    private func setup() {
        setupNavigationItem()
        fetchMovieList()
        bindLayoutEvents()
    }
    
    private func fetchMovieList(){
        contentView.show(state: .loading)

        repository.fetchMovies() { (result) in
            switch result {
            case .success(let items):
                self.contentView.show(state: .ready(items.results))
            case .failure:
                self.showAlertError()
            }
        }
    }
    
    private func showAlertError() {
        let alert = UIAlertController(title: MovieStrings.errorTitle, message: MovieStrings.errorSubtitle, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: MovieStrings.tryAgain, style: UIAlertAction.Style.destructive, handler: { _ in
            self.fetchMovieList()
        }))
        
        present(alert, animated: true, completion: nil)
    }

    private func bindLayoutEvents() {
        contentView.didSelect = { [weak self] movie in
            self?.createNavigationDetail(movie: movie)
        }
    }

    private func createNavigationDetail(movie: Movie) {
        let detailViewController = MovieDetailViewController(movie: movie)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    private func setupNavigationItem() {
        self.navigationItem.title = MovieStrings.popularList
    }
}
