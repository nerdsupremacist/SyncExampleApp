
import Foundation
import Sync

public class ViewModel: SyncableObject {
    @Synced
    public var toggle: Bool = false

    public init() { }
}
