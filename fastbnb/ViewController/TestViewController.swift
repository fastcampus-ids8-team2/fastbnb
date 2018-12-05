//import UIKit
//import Alamofire
//
//final class TestViewController: UIViewController {
//
//    var data: [String] = []
//    var tableView: UITableView?
//
//
//    func fetch() {
//
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let manager = NetworkManager()
//        manager.delegate = self
//        manager.fetch(completion: { listing -> Void in
//            self.data = listing
//            self.tableView.reloadData()
//        })
//    }
//}
//
//extension TestViewController: NetworkManagerDelegate {
//    func action(model: Listing) {
//        self.data = model
//        self.tableView?.reloadData()
//    }
//}
//
//extension TestViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//}
//
//class NetworkManager {
//
//    weak var delegate: NetworkManagerDelegate?
//
//    func fetch(completion: @escaping (Listing) -> Void) {
//        Alamofire
//            .request(<#T##url: URLConvertible##URLConvertible#>)
//            .response { response in
//                let listing =
//                completion(listing)
//                delegate?.action(model: listing)
//            }
//    }
//}
//
//protocol NetworkManagerDelegate: class {
//
//    func action(model: Listing)
//}
