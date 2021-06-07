//
//  ViewController.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import UIKit

class ViewController: BaseViewController {

    // MARK: - Dependencies

    private let networkService: PhotoNetworkServiceProtocol
    private var dataSource = [GetPhotoDataResponse]()

    

    // MARK: - Init

    init(networkService: PhotoNetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PhotoCell.self, forCellReuseIdentifier: PhotoCell.indentifirer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Random Cats >^_^<"
        configureUI()
        loadData()
    }

    deinit {
        print("ViewController deinit")
    }

    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadData() {
        isLoading = true
        networkService.getData(with: { self.process($0) })
    }

    private func process(_ response: GetPhotosAPIResponse) {
        DispatchQueue.main.async {
            switch response {
            case .success(let data):
                self.dataSource.append(contentsOf: data.photos)
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlert(for: error)
            }
            self.isLoading = false
        }
    }

    private func showAlert(for error: NetworkServiceError) {
        let alert = UIAlertController(title: "Опаньки, что-то пошло не так",
                                      message: message(for: error),
                                      preferredStyle: .alert)
        present(alert, animated: true)
    }

    private func message(for error: NetworkServiceError) -> String {
        switch error {
        case .network:
            return "Упал запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unknown:
            return "Непонятно"
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.indentifirer, for: indexPath)
        (cell as? PhotoCell)?.configure(with: dataSource[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1, !isLoading {
            isLoading = true
            networkService.getData(with: { self.process($0) })
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = ImageViewController(networkService: networkService, imageUrl: dataSource[indexPath.row].src.original)
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}



