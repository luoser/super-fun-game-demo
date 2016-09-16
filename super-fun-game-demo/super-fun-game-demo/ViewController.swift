import UIKit

internal final class ViewController: UIViewController {

  @IBOutlet private weak var actionButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction private func actionButtonTapped() {
    print("Leave me alone!")
  }
}
