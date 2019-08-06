enum ProfileOutCmd {
}

typealias ProfileOut = (ProfileOutCmd) -> Void

protocol ProfileIn: class {
    func openSettings()
}

class ProfilePresenter: ProfileIn, ProfileViewOut {

    private weak var view: ProfileView?
    private let out: ProfileOut

    private weak var settingsIn: SettingsIn?

    init(
        view: ProfileView?,
        out: @escaping ProfileOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
    }

    func openSettings() {
        if self.settingsIn == nil {
            self.settingsIn = self.view?.openSettings { _ in }
        }
    }
}
