
import Foundation
import Sync

public class ViewModel: SyncedObject {
    @Synced
    public var toggle: Bool = false

    public init() { }
}
