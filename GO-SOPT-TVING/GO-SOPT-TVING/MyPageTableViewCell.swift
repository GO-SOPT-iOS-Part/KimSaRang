import UIKit

class MyPageTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    private let backImageView = UIImageView().then {
        $0.image = UIImage(named: "back")
        $0.contentMode = .scaleAspectFit
    }
    
    private let listLabel = UILabel().then {
        $0.textColor = .textGrey2
        $0.font = .tvingMedium(ofSize: 15)
    }
    
    // MARK: - Lift Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setStyle() {
        contentView.addSubviews(backImageView, listLabel)
    }
    
    func setLayout() {
        backImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
            $0.size.equalTo(20)
        }
        
        listLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
    }
    
    func dataBind(_ text: String) {
        listLabel.text = text
    }
    
    
//-------
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
