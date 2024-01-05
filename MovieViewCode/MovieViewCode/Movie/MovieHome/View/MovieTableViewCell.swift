import UIKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {
    private let titleCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let descriptionCellLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 3
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
        addStackViewLayout()
    }
    
    private func buildViewHierarchy() {
        addSubview(stackView)
        addSubview(imageCellImageView)
        stackView.addArrangedSubview(titleCellLabel)
        stackView.addArrangedSubview(descriptionCellLabel)
    }
    
    private func addImagemLayout() {
        imageCellImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageCellImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        imageCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13).isActive = true
    }
    
    private func addTitleLayout(){
        titleCellLabel.leadingAnchor.constraint(equalTo: imageCellImageView.trailingAnchor, constant: 20).isActive = true
        titleCellLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    private func addStackViewLayout() {
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    func show(movie: Movie) {
        titleCellLabel.text = movie.title
        descriptionCellLabel.text = movie.overview
        imageCellImageView.kf.setImage(with: movie.posterUrl())
    }
}
