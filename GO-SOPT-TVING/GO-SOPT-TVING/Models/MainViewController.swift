import UIKit

final class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
        cell.configureCell(popularMovies[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - properties

    private var popularMovies = [Result]()
    
    private let popularMovieTableView = UITableView().then {
        $0.rowHeight = 200
    }

    // MARK: - life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        setTableView()
        register()
        
    }
    
    // MARK: - functions
    
    private func fetchPopularMovie() {
        PopularMovieService.shared.fetchPopularMovieData { response in
            switch response {
            case .success(let data):
                guard let data = data as? PopularMovie else { return }
                self.popularMovies = data.results
                self.popularMovieTableView.reloadData()
            default:
                return
            }
        }
    }
    
    func style() {
        view.backgroundColor = .black
        view.addSubview(popularMovieTableView)
    }
    
    func setLayout() {
        popularMovieTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPopularMovie()
    }
    
    func register() {
        popularMovieTableView.register(PopularMovieTableViewCell.self, forCellReuseIdentifier: PopularMovieTableViewCell.cellIdentifier)
    }
    
    func setTableView() {
        popularMovieTableView.delegate = self
        popularMovieTableView.dataSource = self
    }
    
}


