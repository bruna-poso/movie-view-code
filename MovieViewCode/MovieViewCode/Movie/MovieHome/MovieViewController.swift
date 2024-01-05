import UIKit

final class MovieViewController: UITableViewController {

    private var contentView: MovieView
    private var repository: MovieRepository
    
    init(contentView: MovieView = MovieView(), 
         repository: MovieRepository = MovieRepository(http: APIClient())) {
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
        repository.fetchMovies() { (result) in
            switch result {
            case .success(let items):
                self.contentView.show(movies: items.results)
            case .failure(let error):
                // TODO: O que acha de tratar isso aqui mostrando um Alert?
                print("\(self) error on get movies: \(error)")
            }
        }
    }

    private func bindLayoutEvents() {
        contentView.didSelect = { [weak self] movie in
            self?.createNavigationDetail(movie: movie)
        }
    }

    private func createNavigationDetail(movie: Movie) {
        let movieDetailView = MovieDetailView()
        let detailViewController = MovieDetailViewController(movie: movie, contentView: movieDetailView)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    private func setupNavigationItem() {
        self.navigationItem.title = MovieStrings.popularList
    }
}
