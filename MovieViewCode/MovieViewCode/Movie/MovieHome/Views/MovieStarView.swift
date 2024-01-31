import Foundation
import UIKit

final class MovieStarView: UIView {
    private let imageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "star-icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let rateTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(rateTextLabel)
    }
    
    private func addConstraints() {
        addImagemLayout()
        addRateLayout()
    }
    
    private func addImagemLayout() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addRateLayout(){
        NSLayoutConstraint.activate([
            rateTextLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            rateTextLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            rateTextLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            rateTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func show(voteAverage: Double) {
        rateTextLabel.text = String(format: "%.1f", voteAverage)
    }
}
