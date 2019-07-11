import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var viewModel: StoreViewModelInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        bind()
    }

    private func bind() {
        viewModel.titleChangeHandler = { [weak self] title in
            self?.titleLabel.text = title
        }

        viewModel.itemsChangeHandler = { [weak self] itemsString in
            self?.dataLabel.text = itemsString
        }
    }

    @IBAction func resetAction(_ sender: Any) {
        viewModel.reset()
    }

    @IBAction func toSearch(_ sender: Any) {
        show(DI.resolver.resolve(StoreSearchViewController.self)!, sender: nil)
    }
}

