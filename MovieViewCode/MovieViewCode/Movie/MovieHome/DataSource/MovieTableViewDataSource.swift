import UIKit
import SkeletonView

final class MovieTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var didSelect: ((Movie) -> Void)?

    private var movieState: MovieState
    private let cellId = "cellId"
    
    init(state: MovieState) {
        self.movieState = state
    }
    
    func register(in tableView: UITableView) {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: self.cellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch movieState {
        case .ready(let movies):
            return movies.count
        case .loading:
            return 10
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch movieState {
        case .ready(let movies):
            let movie = movies[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
            
            cell.hideSkeleton()
            cell.show(movie: movie)
            return cell
            
        case .loading:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
            cell.layoutIfNeeded()
            cell.showSkeleton()
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if case let .ready(movies) = movieState {
             didSelect?(movies[indexPath.row])
         }
    }
}

extension  MovieTableViewDataSource: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return cellId
    }
}
