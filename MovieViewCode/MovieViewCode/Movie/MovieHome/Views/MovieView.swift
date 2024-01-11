import UIKit

final class MovieView: UIView {
    var didSelect: ((Movie) -> Void)?

    private var dataSource: MovieTableViewDataSource?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        buildViewHierarchy()
        addConstraints()
        bindLayoutEvents()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(tableView)
    }

    private func bindLayoutEvents() {
        dataSource?.didSelect = { [weak self] movie in
            self?.didSelect?(movie)
        }
    }

    private func addConstraints() {
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension MovieView: MovieViewType {
    func show(movies: [Movie]) {
        dataSource = MovieTableViewDataSource(movieList: movies)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource?.register(in: self.tableView)
        self.tableView.reloadData()
        
        //TO DO: Mudar isso de lugar
        dataSource?.didSelect = { [weak self] movie in
            self?.didSelect?(movie)
        }
    }
}
