import ReactiveCocoa
import Result
import XCTest

public final class ViewModelTests: XCTestCase {
  private let vm: ViewModelType = ViewModel()

  public override func setUp() {
    super.setUp()
    AppEnvironment.pushEnvironment()
  }

  public override func tearDown() {
    super.tearDown()
    AppEnvironment.popEnvironment()
  }
}
