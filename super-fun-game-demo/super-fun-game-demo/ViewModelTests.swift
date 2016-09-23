import ReactiveCocoa
import Result
import XCTest

public final class ViewModelTests: XCTestCase {
  private let viewModel: ViewModelType = ViewModel()
  private let trackingClient = MockTrackingClient()

  public override func setUp() {
    super.setUp()

    AppEnvironment.pushEnvironment(panda: Panda(client: trackingClient))
  }

  func testButtonTap() {
    self.viewModel.inputs.actionButtonTapped()

    XCTAssertEqual(["Button Tapped"], self.trackingClient.events)
  }

  public override func tearDown() {
    super.tearDown()
  }
}
