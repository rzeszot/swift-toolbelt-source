import SwiftUI

struct ToolbeltKey: EnvironmentKey {
    static var defaultValue: Bool {
        #if DEBUG
            true
        #else
            false
        #endif
    }
}
