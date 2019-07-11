import UIKit

class StoreSearchViewController: UIViewController {
    static let storyboardId = "StoreSearchViewController"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var viewModel: StoreSearchViewModelInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        bind()
        viewModel.filter(to: "Bagel")
    }

    private func bind() {
        viewModel.titleChangeHandler = { [weak self] title in
            self?.titleLabel.text = title
        }

        viewModel.itemsChangeHandler = { [weak self] itemsString in
            self?.dataLabel.text = itemsString
        }
    }

    @IBAction func backAction(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

