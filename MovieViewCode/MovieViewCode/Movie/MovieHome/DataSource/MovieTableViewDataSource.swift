
import UIKit

final class MovieTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var didSelect: ((Movie) -> Void)?

    private var movieList: [Movie]
    private let cellId = "cellId"

    init(movieList: [Movie]) {
        self.movieList = movieList
    }
    
    func register(in tableView: UITableView) {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: self.cellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
        cell.show(movie: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(movieList[indexPath.row])
    }
}
