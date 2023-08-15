import SwiftUI

struct ToolbeltKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

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

public extension View {
    func toolbelt(_ isEnabled: Bool) -> some View {
        environment(\.toolbelt, isEnabled)
    }
}
