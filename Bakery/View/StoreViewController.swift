import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: StoreViewModelInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        titleLabel.text = viewModel.title
    }

    
}

