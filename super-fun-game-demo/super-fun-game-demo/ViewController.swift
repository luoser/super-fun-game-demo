import UIKit

internal final class ViewController: UIViewController {
  private let viewModel: ViewModelType = ViewModel()

  @IBOutlet private weak var actionButton: UIButton!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var scoreLabel: UILabel!

  internal override func viewDidLoad() {
    super.viewDidLoad()

    self.imageView.image = nil
    self.scoreLabel.text = "0"

    self.viewModel.outputs.buttonTitle
      .observeNext { [weak self] title in
        self?.actionButton.titleLabel?.text = title
    }

    self.viewModel.outputs.image
      .observeNext { [weak self] image in
        self?.imageView.image = image
    }

    self.viewModel.outputs.hint
      .observeNext { [weak self] hint in
        self?.actionButton.accessibilityHint = hint
    }

    self.viewModel.outputs.scoreLabel
      .observeNext { [weak self] score in
        self?.scoreLabel.text = score
    }
  }

  @IBAction private func actionButtonTapped() {
    self.viewModel.inputs.actionButtonTapped()
  }

  private func doSomething(message: String) {
    print(message)
  }
}
