import UIKit
import Kingfisher
import SkeletonView

final class MovieTableViewCell: UITableViewCell {
    private let titleCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.isSkeletonable = true
        lbl.skeletonTextNumberOfLines = 1
        lbl.linesCornerRadius = 4
        return lbl
    }()
    
    private let descriptionCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isSkeletonable = true
        lbl.skeletonTextNumberOfLines = 3
        lbl.linesCornerRadius = 4
        return lbl
    }()
    
    private let imageCellImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 50
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .gray
        imgView.isSkeletonable = true
        return imgView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let starView: MovieStarView = {
        let view = MovieStarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSkeletonable = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupLayoutCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageCellImageView.image = nil
    }
    
    private func setupLayoutCell() {
        addImagemLayout()
        addStarLayout()
        addTitleLayout()
        addDescriptionLayout()
        addStackViewLayout()
    }
    
    private func buildViewHierarchy() {
        stackView.addArrangedSubview(titleCellLabel)
        stackView.addArrangedSubview(descriptionCellLabel)
        addSubview(stackView)
        
        addSubview(imageCellImageView)
        addSubview(starView)

    }
    
    func showSkeleton() {
        titleCellLabel.showAnimatedGradientSkeleton()
        descriptionCellLabel.showAnimatedGradientSkeleton()
        imageCellImageView.showAnimatedGradientSkeleton()
        starView.showAnimatedGradientSkeleton()
    }
    
    func hideSkeleton() {
        titleCellLabel.hideSkeleton()
        descriptionCellLabel.hideSkeleton()
        imageCellImageView.hideSkeleton()
        starView.hideSkeleton()
    }
    
    private func addImagemLayout() {
        NSLayoutConstraint.activate([
            imageCellImageView.widthAnchor.constraint(equalToConstant: 100),
            imageCellImageView.heightAnchor.constraint(equalToConstant: 100),
            imageCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            imageCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13)
        ])
    }
    
    private func addStarLayout(){
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(equalTo: imageCellImageView.bottomAnchor, constant: 10),
            starView.centerXAnchor.constraint(equalTo: imageCellImageView.centerXAnchor),
            starView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func addTitleLayout(){
        NSLayoutConstraint.activate([
            titleCellLabel.leadingAnchor.constraint(equalTo: imageCellImageView.trailingAnchor, constant: 20),
            titleCellLabel.topAnchor.constraint(equalTo: imageCellImageView.topAnchor)
        ])
    }
    
    private func addDescriptionLayout(){
        NSLayoutConstraint.activate([
            descriptionCellLabel.topAnchor.constraint(equalTo: titleCellLabel.bottomAnchor, constant: 4),
        ])
    }
    
    private func addStackViewLayout() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: starView.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 95),
        ])
    }
    
    func show(movie: Movie) {
        let releaseYear = String(movie.release_date.prefix(4))
        let movieTitle = "\(movie.title) (\(releaseYear))"
        titleCellLabel.text = movieTitle
        imageCellImageView.kf.setImage(with: movie.posterUrl())
        starView.show(voteAverage: movie.vote_average)

        if movie.overview.isEmpty {
            descriptionCellLabel.text = "A sinopse não está disponível no seu idioma \n"
        } else {
            descriptionCellLabel.text = movie.overview
        }
    }
}
