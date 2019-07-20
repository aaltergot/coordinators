class ProfilePresenter: ProfileViewOut {

    private weak var viewIn: ProfileViewIn?

    private let out: ProfileOut

    init(
        viewIn: ProfileViewIn?,
        out: @escaping ProfileOut
    ) {
        self.viewIn = viewIn
        self.out = out
    }

    func viewDidLoad() {
        self.out(.register(ModuleIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    func settingsButtonPressed() {
        self.out(.openSettings)
        self.out(.getData { print($0) })
    }

    private func invoke(_ cmd: ProfileInCmd) {}

}
