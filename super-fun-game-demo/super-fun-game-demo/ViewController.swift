import UIKit

internal final class ViewController: UIViewController {
  private let viewModel: ViewModelType = ViewModel()

  @IBOutlet private weak var actionButton: UIButton!

  internal override func viewDidLoad() {
    super.viewDidLoad()

    self.viewModel.outputs.doSomething
      .observeNext { [weak self] msg in
        self?.doSomething(msg)
    }

    self.viewModel.outputs.hint
      .observeNext { [weak self] hint in
        self?.actionButton.accessibilityHint = hint
    }
  }

  @IBAction private func actionButtonTapped() {
    self.viewModel.inputs.actionButtonTapped()
  }

  private func doSomething(message: String) {
    print(message)
  }
}
