class TabBarPresenter: TabBarViewOut {

    private weak var viewIn: TabBarViewIn?

    private let out: TabBarOut

    init(
        viewIn: TabBarViewIn?,
        out: @escaping TabBarOut
    ) {
        self.viewIn = viewIn
        self.out = out
    }

    func viewCreated() {
        self.out(.register(ModuleIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    private func invoke(_ cmd: TabBarInCmd) { switch cmd {
    case let .showTab(tab):
        self.viewIn?.showTab(tab)
    }}
}
