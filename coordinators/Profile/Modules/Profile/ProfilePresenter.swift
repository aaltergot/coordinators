enum ProfileOutCmd {
    case openSettings
}

typealias ProfileOut = (ProfileOutCmd) -> Void

protocol ProfileIn: class {
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
        self.out(.openSettings)
    }
}
