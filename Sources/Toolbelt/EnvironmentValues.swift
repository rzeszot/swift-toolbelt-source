import SwiftUI

public extension EnvironmentValues {
    var toolbelt: Bool {
        get {
            self[ToolbeltKey.self]
        }
        set {
            self[ToolbeltKey.self] = newValue
        }
    }
}
