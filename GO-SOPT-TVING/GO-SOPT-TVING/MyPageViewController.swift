import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController, UITableViewDelegate {
    //MARK: - Properties
    
    private var myPageSetList = MyPageSeList()
    
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "back"), for: .normal)
        $0.addTarget(self,
                     action: #selector(backButtonTap),
                     for: .touchUpInside)
    }
    
    private let contentView = UIView()
    private let headerView = MyPageHeaderView()
    
    private let tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.isScrollEnabled = false
        $0.register(MyPageTableViewCell.self,
                           forCellReuseIdentifier: MyPageTableViewCell.className)
    }
    
    private let scrollView = UIScrollView().then {
        $0.bounces = false
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    

    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()

    }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.updateConstraints {
            $0.height.equalTo(tableView.contentSize.height)
        }
    }

}

extension MyPageViewController {
    
    private func style() {
        view.backgroundColor = .black
        view.addSubviews(navigationView,
                         scrollView)
        navigationView.addSubview(backButton)
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView,tableView)
    }
    
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(15)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
            $0.edges.equalTo(scrollView.contentLayoutGuide)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.height.equalTo(tableView.contentSize.height)
            $0.bottom.equalToSuperview().offset(-30)
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
    }
}

extension MyPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return myPageSetList.userSetList.count
        case 1:
            return myPageSetList.appSetList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.className, for: indexPath) as? MyPageTableViewCell
        else { return UITableViewCell()}
        
        switch indexPath.section {
        case 0:
            cell.dataBind(myPageSetList.userSetList[indexPath.row])
            
        case 1:
            cell.dataBind(myPageSetList.appSetList[indexPath.row])
        default:
            fatalError("\(#function)에서 에러가 발생했습니다.")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
}

extension MyPageViewController {
    
    private func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bind() {
     
    }
    
    
    //MARK: - Action
    
    @objc
    private func backButtonTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyPageViewController {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return MyPageFooterView(isLastSection: false).intrinsicContentSize.height
        case 1:
            return MyPageFooterView(isLastSection: true).intrinsicContentSize.height
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            return MyPageFooterView(isLastSection: false)
        case 1:
            return MyPageFooterView(isLastSection: true)
        default:
            return nil
        }
    }
}
