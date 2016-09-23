/**
 A global stack that captures the current state of global objects that the app wants access to.
 
 Based on AppEnvironment.swift in the Kickstarter swift repo by Brandon Williams.
 */

public struct Environment {
  public let panda: Panda

  public init(panda: Panda = Panda(client: TrackingClient())) {
    self.panda = panda
  }
}

public struct AppEnvironment {

  // A global stack of environments.
  private static var stack: [Environment] = [Environment()]

  // The most recent environment on the stack.
  public static var current: Environment! {
    return stack.last
  }

  // Pop an environment off the stack.
  public static func popEnvironment() -> Environment? {
    return stack.popLast()
  }

  // Push a new environment onto the stack.
  public static func pushEnvironment(env: Environment) {
    stack.append(env)
  }

  // Pushes a new environment onto the stack that changes only a subset of the current global dependencies.
  public static func pushEnvironment(panda panda: Panda = AppEnvironment.current.panda) {

    pushEnvironment(Environment(panda: panda))

  }
}
