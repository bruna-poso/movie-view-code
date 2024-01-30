import UIKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {
    private let titleCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private let descriptionCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 4
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let imageCellImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 50
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .gray
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
        addTitleLayout()
        addDescriptionLayout()
        addStackViewLayout()
    }
    
    private func buildViewHierarchy() {
        addSubview(stackView)
        addSubview(imageCellImageView)
        stackView.addArrangedSubview(titleCellLabel)
        stackView.addArrangedSubview(descriptionCellLabel)
    }
    
    private func addImagemLayout() {
        NSLayoutConstraint.activate([
            imageCellImageView.widthAnchor.constraint(equalToConstant: 100),
            imageCellImageView.heightAnchor.constraint(equalToConstant: 100),
            imageCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            imageCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13)
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
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 95),
        ])
    }
    
    func show(movie: Movie) {
        let releaseYear = String(movie.release_date.prefix(4))
        let movieTitle = "\(movie.title) (\(releaseYear))"
        titleCellLabel.text = movieTitle

        if movie.overview.isEmpty {
            descriptionCellLabel.text = "A sinopse não está disponível no seu idioma"
        } else {
            descriptionCellLabel.text = movie.overview
        }
        
        imageCellImageView.kf.setImage(with: movie.posterUrl())
    }
}
