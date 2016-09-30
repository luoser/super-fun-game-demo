import ReactiveCocoa
import UIKit

internal final class ViewController: UIViewController {
  private var score: Int = 0

  @IBOutlet private weak var actionButton: UIButton!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var scoreLabel: UILabel!

  internal override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction private func actionButtonTapped() {
    self.playGame()
  }

  private func playGame() {
    score += 1

    self.scoreLabel.text = String(score)

    switch score {
    case 0...3:
      self.imageView.image = UIImage(named: "happy")
    case 4...7:
      self.imageView.image = UIImage(named: "content")
    default:
      self.imageView.image = UIImage(named: "grumpy")
    }
  }
}