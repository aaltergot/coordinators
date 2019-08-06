protocol ProfileTabIn: class {
    func processDeepLink(_ deepLink: String)
}

enum ProfileTabOutCmd {
}

typealias ProfileTabOut = (ProfileTabOutCmd) -> Void

class ProfileTabPresenter: ProfileTabIn, ProfileTabViewOut {

    private weak var view: ProfileTabView?
    private let out: ProfileTabOut

    private weak var profileIn: ProfileIn?

    init(
        view: ProfileTabView?,
        out: @escaping ProfileTabOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
        self.openProfile()
    }

    func processDeepLink(_ deepLink: String) {
        let split = deepLink.split(separator: "/")
        if split.first == "settings" {
            self.openProfile()
            self.profileIn?.openSettings()
        }
    }

    private func openProfile() {
        if self.profileIn == nil {
            self.profileIn = self.view?.openProfile { _ in }
        }
    }
}
