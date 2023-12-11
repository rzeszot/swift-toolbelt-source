import SwiftUI

public extension View {
    @inlinable
    func toolbelt(_ isEnabled: Bool) -> some View {
        environment(\.toolbelt, isEnabled)
    }
}
