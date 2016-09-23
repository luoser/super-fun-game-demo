import ReactiveCocoa
import Result
import XCTest

public final class ViewModelTests: XCTestCase {
  private let viewModel: ViewModelType = ViewModel()
  private let trackingClient = MockTrackingClient()

  private let hint = TestObserver<String, NoError>()

  public override func setUp() {
    super.setUp()

    AppEnvironment.pushEnvironment(panda: Panda(client: trackingClient))

    self.viewModel.outputs.hint.observe(self.hint.observer)
  }

  func testButtonAccessibilityHint() {
    self.viewModel.inputs.actionButtonTapped()
    self.hint.assertValues(["Prints message."])
  }

  func testButtonTap() {
    self.viewModel.inputs.actionButtonTapped()

    XCTAssertEqual(["Button Tapped"], self.trackingClient.events)
  }

  public override func tearDown() {
    super.tearDown()
  }
}
