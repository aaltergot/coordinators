class SettingsView: SettingsViewType, SettingsViewIn {

    var viewOut: SettingsViewOut?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut?.viewDidLoad()
    }

    private func setupView() {
        self.title = "Settings"
    }

    @IBAction func logoutButtonPressed() {
        viewOut?.logoutButtonPressed()
    }
}
