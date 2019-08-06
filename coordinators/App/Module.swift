class ModuleIn<InCmd> {
    private weak var ref: AnyObject?
    private let moduleIn: (InCmd) -> Void

    init(ref: AnyObject?, moduleIn: @escaping (InCmd) -> Void) {
        self.ref = ref
        self.moduleIn = moduleIn
    }

    func isAlive() -> Bool {
        return self.ref != nil
    }

    func invoke(_ cmd: InCmd) {
        if self.isAlive() {
            moduleIn(cmd)
        }
    }
}