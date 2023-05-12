import UIKit

import Kingfisher
import SnapKit

class PopularMovieTableViewCell: UITableViewCell {
    
    var imageURL: URL?
    
    // MARK: - UI Components
    
    private lazy var movieImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.contentMode = .scaleAspectFill

    }
    
    private lazy var movieTitleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .tvingSemiBold(ofSize: 20)
        $0.numberOfLines = 2
    }
    
    private lazy var overViewLabel = UILabel().then {
        $0.textColor = .textGrey2
        $0.font = .tvingRegular(ofSize: 15)
        $0.numberOfLines = 5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleUI()
        setLayout()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - functions
    
    func styleUI() {
        contentView.backgroundColor = .black
        contentView.addSubviews(movieImageView,
                                movieTitleLabel,
                                overViewLabel)
    }
    
    func setLayout() {
        movieImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(160)
            $0.width.equalTo(120)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.width.equalTo(205)
            $0.leading.equalTo(movieImageView.snp.trailing).offset(15)
        }
        
        overViewLabel.snp.makeConstraints {
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(10)
            $0.width.equalTo(205)
            $0.leading.equalTo(movieTitleLabel)
        }
    }
    
    func configureCell(_ result: Result){
        imageURL = URL(string: "https://image.tmdb.org/t/p/original/" + (result.posterPath ) ) ?? nil
        movieTitleLabel.text = result.originalTitle
        overViewLabel.text = result.overview
        movieImageView.kf.setImage(with: imageURL)
    }
    
}

extension PopularMovieTableViewCell {
    static var cellIdentifier : String {
        return String(describing: self)
    }
}
