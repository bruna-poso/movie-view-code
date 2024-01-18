
import UIKit
import Kingfisher

final class MovieDetailView: UIView {

    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        return scrollView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titleDetailLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let descriptionDetailLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let imageDetailImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 50
        imgView.clipsToBounds = true
        imgView.backgroundColor = .gray
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        buildViewHierarchy()
        setupLayoutDetail()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayoutDetail(){
        addConstraintsImage()
        addConstraintsScrollView()
        addConstraintsStackView()
    }

    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(imageDetailImageView)
        stackView.setCustomSpacing(20, after: imageDetailImageView)
        stackView.addArrangedSubview(titleDetailLabel)
        stackView.addArrangedSubview(descriptionDetailLabel)
    }

    private func addConstraintsImage() {
        imageDetailImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        let aspectRatioConstraint = NSLayoutConstraint(item: imageDetailImageView,attribute: .height,relatedBy: .equal,toItem: imageDetailImageView,attribute: .width,multiplier: (1.4 / 1.2),constant: 0)
        self.imageDetailImageView.addConstraint(aspectRatioConstraint)
    }

    private func addConstraintsStackView() {
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,  constant: 30).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true
    }

    private func addConstraintsScrollView() {
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
}

extension MovieDetailView: MovieDetailViewType {
    func show(viewModel: Movie){
        titleDetailLabel.text = viewModel.title
        descriptionDetailLabel.text = viewModel.overview
        imageDetailImageView.kf.setImage(with: viewModel.posterUrl())
    }
}
